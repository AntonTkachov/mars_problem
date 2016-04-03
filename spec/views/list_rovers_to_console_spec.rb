describe ListRoversToConsole do
  let(:rover1) { Rover.new(1, 2, 'N', '') }
  let(:rover2) { Rover.new(3, 3, 'E', '') }
  let(:view) { ListRoversToConsole.new([rover1, rover2]) }

  it 'displays valid output' do
    $stdout = StringIO.new
    view.render
    $stdout.rewind
    expect($stdout.gets).to eq("\"1 2 N\\n3 3 E\\n\"\n")
  end
end
