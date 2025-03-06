require 'pry-byebug'
require 'rspec'
require_relative '../src/example'

describe Example do
  it 'prints example text' do
    instance = described_class.new(arg1: 'value1')

    expect { instance.call }.to output(%(Example#call with args: {arg1: "value1"}\n)).to_stdout
  end

  it 'has syntactic sugar' do
    expect { described_class.call(arg1: 'value1') }.to output(%(Example#call with args: {arg1: "value1"}\n)).to_stdout
  end
end
