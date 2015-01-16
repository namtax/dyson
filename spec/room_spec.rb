describe Room do
  subject    { Room.new(%[5 5], dirt) }
  let(:dirt) { [] }

  it { expect(subject.x).to eq 5 }
  it { expect(subject.y).to eq 5 }

  describe '#dirt_patch?' do
    let(:dirt) { [%[1 1], %[2 2]] }
    it { expect(subject.dirt_patch?(%[1 1])).to be true }
    it { expect(subject.dirt_patch?(%[2 2])).to be true }
    it { expect(subject.dirt_patch?(%[3 2])).to be false }
  end

  describe '#remove_dirt' do
    let(:dirt) { [pos] }
    let(:pos)  { %[1 1] }
    it 'removes it' do
      subject.remove_dirt(pos)
      expect(subject.dirt_patch?(pos)).to be false
    end
  end
end
