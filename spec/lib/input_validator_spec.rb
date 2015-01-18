module Dyson
  describe InputValidator do
    describe '#validate' do
      subject     { InputValidator.new(input) }

      context 'missing commands' do
        let(:input) { [["5 5\n"]] }
        it { expect{subject.validate}.to raise_error('Please provide full input - see readme!') }
      end

      context 'invalid coords' do
        let(:input) { ["5 X\n", "1 2\n", "1 0\n", "2 2\n", "2 3\n", "NNESEESWNWW"] }
        it { expect{subject.validate}.to raise_error('Please provide valid coords - see readme!') }
      end

      context 'missing coords' do
        let(:input) { ["5", "1 2\n", "1 0\n", "2 2\n", "2 3\n", "NNESEESWNWW"] }
        it { expect{subject.validate}.to raise_error('Please provide valid coords - see readme!') }
      end

      context 'coords out of bounds' do
        let(:input) { ["5 5", "10 2\n", "1 0\n", "2 2\n", "2 3\n", "NNESEESWNWW"] }
        it { expect{subject.validate}.to raise_error('Please provide valid coords - see readme!') }
      end

      context 'invalid instructions' do
        let(:input) { ["5 5", "1 2\n", "1 0\n", "2 2\n", "2 3\n", "XXNNESEESWNWW"] }
        it { expect{subject.validate}.to raise_error('Please provide valid instructions - see readme!') }
      end
    end
  end
end
