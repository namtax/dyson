describe FileParser do 
  subject { FileParser.new }

  it { expect(subject.dirt_patches).to eq [[1, 0], [2, 2], [2, 3]] }
  it { expect(subject.room_dimensions).to eq [5, 5] }
  it { expect(subject.hoover_pos).to eq [1, 2] }
  it { expect(subject.instructions).to eq %q[NNESEESWNWW] }

  context 'file missing' do 
    before { allow_any_instance_of(FileParser).to receive(:file_path).and_return('bin/doesnt_exist') }
    it     { expect{subject}.to raise_error('Please store input file at /bin/input.txt') }
  end

  context 'input is missing commands' do 
    before { allow(File).to receive(:readlines).and_return(["5 5\n"]) }
    it     { expect{subject}.to raise_error('Please provide full input - see readme!') }
  end

  context 'input contains invalid co-ordinates' do 
    let(:invalid_coords) { ["5 X\n", "1 2\n", "1 0\n", "2 2\n", "2 3\n", "NNESEESWNWW"] } 
    before { allow(File).to receive(:readlines).and_return(invalid_coords) }
    it     { expect{subject}.to raise_error('Please provide valid coords - see readme!') }
  end

  context 'input contains missing co-ordinates' do 
    let(:invalid_coords) { ["5", "1 2\n", "1 0\n", "2 2\n", "2 3\n", "NNESEESWNWW"] } 
    before { allow(File).to receive(:readlines).and_return(invalid_coords) }
    it     { expect{subject}.to raise_error('Please provide valid coords - see readme!') }
  end

  context 'coords out of bounds' do 
    let(:invalid_coords) { ["5 5", "10 2\n", "1 0\n", "2 2\n", "2 3\n", "NNESEESWNWW"] } 
    before { allow(File).to receive(:readlines).and_return(invalid_coords) }
    it     { expect{subject}.to raise_error('Please provide valid coords - see readme!') }
  end

  context 'input contains invalid instructions' do 
    let(:invalid_instruct) { ["5 5", "1 2\n", "1 0\n", "2 2\n", "2 3\n", "XXNNESEESWNWW"] } 
    before { allow(File).to receive(:readlines).and_return(invalid_instruct) }
    it     { expect{subject}.to raise_error('Please provide valid instructions - see readme!') }
  end
end
