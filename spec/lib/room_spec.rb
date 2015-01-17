describe Room do
  subject    { Room.new([5, 5], dirt) }
  let(:dirt) { [] }

  it { expect(subject.floor.flatten.size).to eq 25 }

  describe '.initialize' do
    let(:dirt) { [[1, 1], [2, 2]] }
    it { expect(subject.item_present?([1, 1], :dirt)).to be true }
    it { expect(subject.item_present?([2, 2], :dirt)).to be true }
    it { expect(subject.item_present?([3, 2], :dirt)).to be false }
  end

  describe '#remove_item' do
    let(:dirt) { [pos] }
    let(:pos)  { [1, 1] }
    it 'removes it' do
      subject.add_item(pos, :clean)
      expect(subject.item_present?(pos, :clean)).to be true
    end
  end
end
