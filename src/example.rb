class Example
  def self.call(...)
    new(...).call
  end

  def initialize(**args)
    @args = args
  end

  def call
    puts "Example#call with args: #{args}"
  end

  private

  attr_reader :args
end
