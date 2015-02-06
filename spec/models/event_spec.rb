require 'rails_helper'

describe Event do
  describe '#name' do
    it { should validate_presence_of(:name)}
    it { should ensure_length_of(:name).is_at_most(50)}


    context '空白の時' do
      let(:event) { Event.new(name: '') }

      it 'validでないこと' do
        event.valid?
        expect(event.errors[:name]).to be_present
      end
    end
  end

  describe '#created_by?' do
    let(:event) { create(:event) }
    subject { event.created_by?(user) }

    context '引数がnilなとき' do
      let(:user) { nil }
      it { should be_falsey }
    end

    context '#owner_idと引数の#idが同じ時' do
      let(:user) { double('user', id: event.id) }
      it { should be_truthy }
    end
  end

  describe '#rails?' do
    context '#nameが"Rails勉強会"のとき' do
      it 'trueを返すこと' do
        event = create(:event, name: 'Rails勉強会')
        expect(event.rails?).to eq true
      end
    end

    context '#nameが”Ruby勉強会"のとき' do
      it 'falseを返すこと' do
        event = create(:event, name: 'Ruby勉強会')
        expect(event.rails?).to eq false
      end
    end
  end
end
