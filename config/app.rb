require 'bundler/setup'

Bundler.require

require 'active_support/all'
require 'dotenv'
require 'pry-byebug'
require 'thor'
require 'thor_ext'
require 'zeitwerk'

class App
  def self.start
    load
  end

  def self.instance
    @instance ||= new
  end

  # rubocop:disable Lint/UselessMethodDefinition, Style/RedundantInitialize
  private def initialize = super
  # rubocop:enable Lint/UselessMethodDefinition, Style/RedundantInitialize

  def self.configure
    yield instance
  end

  def self.load
    return if @loaded

    Dotenv.load
    loader.push_dir(root.join('src'))
    loader.enable_reloading
    # loader.inflector.inflect(
    #   "llm" => "LLM"
    # )
    loader.setup

    @loaded = true
  end

  def self.loader
    @loader ||= Zeitwerk::Loader.new
  end

  def self.current_dir
    @current_dir ||= Pathname.new(File.expand_path(__dir__))
  end

  def self.root
    @root ||= Pathname.new(current_dir.join('..'))
  end

  def self.log(*args)
    logger.info(args)
    puts args
  end

  def self.logger
    @logger ||= begin
      FileUtils.mkdir_p('log')
      Logger.new("log/#{app_name}.log")
    end
  end

  def self.app_name
    root.basename.to_s
  end
end

def reload!
  App.loader.reload
end
