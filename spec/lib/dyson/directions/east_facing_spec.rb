module Dyson
  module Directions
    describe EastFacing do
      subject         { Hoover.new(start_pos, room) }
      let(:start_pos) { [1, 2]}
      let(:room)      { Room.new([5, 5], dirt) }
      let(:dirt)      { [] }

      describe '#go' do
        context 'success' do
          it 'moves up' do
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
    end
  end
end
