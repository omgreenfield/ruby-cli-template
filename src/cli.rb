class Cli < Thor
  extend ThorExt::Start

  desc "example UNNAMED_REQUIRED_ARG [UNNAMED_OPTIONAL_ARG] [-s | -n | -b]", "Does a thing and stuff"
  option :named_string,  aliases: "-s", type: :string,  required: false, desc: "Example named string", default: nil
  option :named_numeric, aliases: "-n", type: :numeric, required: false, desc: "Example named number", default: 123
  option :named_boolean, aliases: "-b", type: :boolean, required: false, desc: "Example named boolean", default: false
  def example(unnamed_required_arg, unnamed_optional_arg = nil)
    Example.call(**options, unnamed_required_arg:,
                            unnamed_optional_arg:)
  end

  desc "pry", "Load CLI and start a Pry session"
  def pry
    binding.pry
  end

  desc "drb", "Load a DRb server, allowing calls from other processes"
  option :port, aliases: "-p", type: :numeric, required: false, desc: "DRBServer port", default: 8787
  def drb
    DrbServer.new(port: options[:port]).call
  end
end
