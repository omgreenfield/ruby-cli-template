require "drb/drb"

class DrbServer
  attr_reader :url, :port

  def initialize(port: 8787)
    @port = port
    @url = "druby://127.0.0.1:#{port}"
  end

  def call
    print_client_example
    puts "(Press `Ctrl + C` to stop)"
    start
  end

  def start
    DRb.start_service(url, self)
    DRb.thread.join
  end

  # @example
  #   server['Util::Json']
  def [](path)
    path.constantize
  end
  alias get []

  private def print_client_example
    puts
    puts "EXAMPLE:"
    puts "=" * 60
    puts CodeRay.scan(client_example, :ruby).terminal
    puts "=" * 60
  end

  private def client_example
    <<~RUBY
      require "drb/drb"

      server = DRbObject.new_with_uri(url)
      server.Util::Json.schema_for(some_object)
    RUBY
  end

  # Construct instance methods for the App and everything else that Zeitwerk loaded
  #
  # @example
  #   server.App.loader
  #   server.Util::Json.schema_for(some_object)
  App.consts.each do |const|
    define_method(const.to_s) do
      const
    end
  end
end
