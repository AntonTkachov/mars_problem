require 'spec_helper'

describe StringBuilder do
  let(:input) { File.open("#{File.dirname(File.expand_path(__FILE__))}/../fixtures/input").read }
  let(:builder) { StringBuilder.new(input) }

  it 'properly builds plateau' do
    plateau = builder.build_plateau

    expect(plateau.instance_variable_get(:@top)).to eq(5)
    expect(plateau.instance_variable_get(:@right)).to eq(5)
  end

  it 'properly builds rovers' do
    rovers = builder.build_rovers

    expect(rovers.count).to eq(2)
    expect(rovers.first.x_pos).to eq(1)
    expect(rovers.first.orientation).to eq('N')
    expect(rovers.last.y_pos).to eq(3)
    expect(rovers.last.instance_variable_get(:@instructions)).to eq("MMRMMRMRRM".split('').to_a)
  end
end
