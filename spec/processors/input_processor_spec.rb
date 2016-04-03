require 'spec_helper'

describe InputProcessor do
  let(:input) { File.open("#{File.dirname(File.expand_path(__FILE__))}/../fixtures/input").read }

  it 'lists final coordinates for all rovers' do
    $stdout = StringIO.new
    InputProcessor.new(input).process
    $stdout.rewind
    expect($stdout.gets).to eq("\"1 3 N\\n5 1 E\\n\"\n")
  end
end
