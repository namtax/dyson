describe Hoover do
  describe '#position' do
    let(:hoover)    { Hoover.new(start_pos, room) }
    let(:start_pos) { %q[1 2]}
    let(:room)      { %q[5 5]}

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
          expect(hoover.position).to eq %[0 2]
        end
      end
    end
  end
end
