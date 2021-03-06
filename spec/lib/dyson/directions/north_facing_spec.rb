module Dyson
  module Directions
    describe NorthFacing do
      subject         { Hoover.new(start_pos, room) }
      let(:start_pos) { [1, 2]}
      let(:room)      { Room.new([5, 5], dirt) }
      let(:dirt)      { [] }

      describe '#go' do
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
    end
  end
end
