class Example
  def self.call(...)
    new(...).call
  end

  def initialize(**args)
    puts args
  end

  def call
    
  end

  private

  attr_reader :instance_var
end
