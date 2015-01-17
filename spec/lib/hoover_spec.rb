describe Hoover do
  subject         { Hoover.new(start_pos, room) }
  let(:start_pos) { [1, 2]}
  let(:room)      { Room.new([5, 5], dirt) }
  let(:dirt)      { [] }

  describe '#run' do
    context 'start' do
      it { expect(subject.position).to eq [1, 2] }
    end

    context 'north' do
      context 'success' do
        it 'moves up' do
          subject.run('N')
          expect(subject.position).to eq [1, 3]
        end
      end

      context 'boundary' do
        let(:start_pos) { [1, 4]}
        it 'slides' do
          subject.run('N')
          expect(subject.position).to eq [1, 4]
        end
      end
    end

    context 'south' do
      context 'success' do
        it 'moves down' do
          subject.run('S')
          expect(subject.position).to eq [1, 1]
        end
      end

      context 'boundary' do
        let(:start_pos) { [1, 0] }
        it 'slides' do
          subject.run('S')
          expect(subject.position).to eq [1, 0]
        end
      end
    end

    context 'east' do
      context 'success' do
        it 'moves right' do
          subject.run('E')
          expect(subject.position).to eq [2, 2]
        end
      end

      context 'boundary' do
        let(:start_pos) { [4, 1]}
        it 'slides' do
          subject.run('E')
          expect(subject.position).to eq [4, 1]
        end
      end
    end

    context 'west' do
      context 'success' do
        it 'moves left' do
          subject.run('W')
          expect(subject.position).to eq [0, 2]
        end
      end

      context 'boundary' do
        let(:start_pos) { [0, 2]}
        it 'slides' do
          subject.run('W')
          expect(subject.position).to eq [0, 2]
        end
      end

      context 'multi' do 
        let(:start_pos) { [0, 0]}
        it 'slides' do
          subject.run('EEWW')
          expect(subject.position).to eq [0, 0]
        end
      end
    end
  end

  describe '#patches_cleaned' do 
    context 'dirt on start position' do 
      let(:start_pos) { [0, 0]}
      let(:dirt)      { [[0, 0]] } 
      it do 
        subject.run('E')
        expect(subject.patches_cleaned).to eq 1
      end
    end

    context 'dirt' do 
      let(:start_pos) { [0, 0]}
      let(:dirt)      { [[0, 1]] } 
      it do 
        subject.run('N')
        expect(subject.patches_cleaned).to eq 1
      end
    end

    context 'patch removed' do 
      let(:start_pos) { [0, 0]}
      let(:dirt)      { [[0, 1]] } 
      it 'cleans patch once' do 
        subject.run('NSN')
        expect(subject.patches_cleaned).to eq 1
      end
    end
  end

  describe '#status' do 
    let(:start_pos) { [0, 0]}
    let(:dirt)      { [[0, 1]] } 
    it 'reports position & work done' do 
      subject.run('N')
      expect(subject.status).to eq %Q[0 1\n1]
    end
  end
end
