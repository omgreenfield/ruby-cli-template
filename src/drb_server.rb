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
  #   server["Util::Json", "schema_for", some_object]
  def [](*)
    constant_call(*)
  end

  private def constant_call(const_path, method_name, ...)
    receiver = resolve_constant(const_path)
    receiver.public_send(method_name, ...)
  end

  private def resolve_constant(const_path)
    const_path.split("::").reject(&:empty?).reduce(Object) do |scope, name|
      scope.const_get(name)
    end
  end

  private def print_client_example
    puts
    puts "EXAMPLE:"
    puts "=" * 60
    puts CodeRay.scan(client_example, :ruby).terminal
    puts "=" * 60
    puts
  end

  private def client_example
    <<~RUBY
      require "drb/drb"

      server = DRbObject.new_with_uri(url)
      server.Util::Json.schema_for(some_object)
    RUBY
  end
end
