module Dyson
  module Directions
    describe SouthFacing do
      subject         { Hoover.new(start_pos, room) }
      let(:start_pos) { [1, 2]}
      let(:room)      { Room.new([5, 5], dirt) }
      let(:dirt)      { [] }

      describe '#go' do
        context 'success' do
          it 'moves up' do
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
    end
  end
end
