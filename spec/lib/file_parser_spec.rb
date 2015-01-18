module Dyson
  describe FileParser do
    subject { FileParser.new }
    before  { allow_any_instance_of(FileParser)
                .to receive(:file_path)
                .and_return('spec/fixtures/input_2.txt') }

    it { expect(subject.dirt_patches).to eq [[1, 0], [2, 2], [2, 3]] }
    it { expect(subject.room_dimensions).to eq [5, 5] }
    it { expect(subject.hoover_pos).to eq [1, 2] }
    it { expect(subject.instructions).to eq %q[NNESEESWNWW] }

    context 'file missing' do
      before { allow_any_instance_of(FileParser)
                .to receive(:file_path)
                .and_return('bin/doesnt_exist') }
      it     { expect{subject}.to raise_error('Please store input file at /bin/input.txt') }
    end
  end
end
