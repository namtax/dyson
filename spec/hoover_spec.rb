describe Hoover do
  let(:hoover)    { Hoover.new(start_pos, room, dirt) }
  let(:start_pos) { %q[1 2]}
  let(:room)      { %q[5 5]}
  let(:dirt)      { [] }

  describe '#position' do
    context 'start' do
      it { expect(hoover.position).to eq %q[1 2] }
    end

    context 'north' do
      context 'success' do
        it 'moves up' do
          hoover.move('N')
          expect(hoover.position).to eq %q[1 3]
        end
      end

      context 'boundary' do
        let(:start_pos) { %q[1 5]}
        it 'slides' do
          hoover.move('N')
          expect(hoover.position).to eq %q[1 5]
        end
      end
    end

    context 'south' do
      context 'success' do
        it 'moves down' do
          hoover.move('S')
          expect(hoover.position).to eq %q[1 1]
        end
      end

      context 'boundary' do
        let(:start_pos) { %q[1 0] }
        it 'slides' do
          hoover.move('S')
          expect(hoover.position).to eq %q[1 0]
        end
      end
    end

    context 'east' do
      context 'success' do
        it 'moves right' do
          hoover.move('E')
          expect(hoover.position).to eq %q[2 2]
        end
      end

      context 'boundary' do
        let(:start_pos) { %q[5 1]}
        it 'slides' do
          hoover.move('E')
          expect(hoover.position).to eq %q[5 1]
        end
      end
    end

    context 'west' do
      context 'success' do
        it 'moves left' do
          hoover.move('W')
          expect(hoover.position).to eq %q[0 2]
        end
      end

      context 'boundary' do
        let(:start_pos) { %q[0 2]}
        it 'slides' do
          hoover.move('W')
          expect(hoover.position).to eq %q[0 2]
        end
      end

      context 'multi' do 
        let(:start_pos) { %q[0 0]}
        it 'slides' do
          hoover.move('EEWW')
          expect(hoover.position).to eq %q[0 0]
        end
      end
    end
  end

  describe '#patches_cleaned' do 
    context 'dirt on start position' do 
      let(:start_pos) { %q[0 0]}
      let(:dirt)      { ["0 0"] } 
      it do 
        hoover.move('E')
        expect(hoover.patches_cleaned).to eq 1
      end
    end

    context 'dirt' do 
      let(:start_pos) { %q[0 0]}
      let(:dirt)      { ["0 1"] } 
      it do 
        hoover.move('N')
        expect(hoover.patches_cleaned).to eq 1
      end
    end

    context 'patch removed' do 
      let(:start_pos) { %q[0 0]}
      let(:dirt)      { ["0 1"] } 
      it do 
        hoover.move('NSN')
        expect(hoover.patches_cleaned).to eq 1
      end
    end
  end
end
