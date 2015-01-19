module Dyson
  module Directions
    describe WestFacing do
      subject         { Hoover.new(start_pos, room) }
      let(:start_pos) { [1, 2]}
      let(:room)      { Room.new([5, 5], dirt) }
      let(:dirt)      { [] }

      describe '#go' do
        context 'success' do
          it 'moves up' do
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
      end
    end
  end
end
