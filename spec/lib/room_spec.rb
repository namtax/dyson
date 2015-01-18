module Dyson
  describe Room do
    subject    { Room.new([5, 5], dirt) }
    let(:dirt) { [] }

    it { expect(subject.floor.flatten.size).to eq 25 }

    describe '.initialize' do
      let(:dirt) { [[1, 1], [2, 2]] }
      it { expect(subject.item_exists?([1, 1], :dirt)).to be true }
      it { expect(subject.item_exists?([2, 2], :dirt)).to be true }
      it { expect(subject.item_exists?([3, 2], :dirt)).to be false }
    end

    describe '#add_item' do
      let(:dirt) { [pos] }
      let(:pos)  { [1, 1] }
      it 'cleans up' do
        subject.add_item(pos, :clean)
        expect(subject.item_exists?(pos, :clean)).to be true
      end
    end
  end
end
