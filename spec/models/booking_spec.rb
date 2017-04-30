require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe '.by_year' do
    context 'when year is 2017 and no records are present' do
      before(:each) { described_class.delete_all }

      it 'returns an empty collection' do
        expect(described_class.by_year(2017)).to be_empty
      end
    end

    context 'when year is 2017 and records are present' do
      before(:each) { described_class.create!(reserved_at: '2017-01-01-12:12') }

      it 'is not empty' do
        expect(described_class.by_year(2017)).to_not be_empty
      end
    end
  end

  describe '.by_week' do
    context 'when no records are present' do
      before(:each) { described_class.delete_all }

      it 'returns an empty collection' do
        expect(described_class.by_week(14, 2017)).to be_empty
      end
    end

    context 'when records are present' do
      before(:each) { described_class.create(reserved_at: '2017-01-04-12:12') }

      it 'has a record from week 1' do
        expect(described_class.pluck(:week_number)).to include(1)
      end

      it 'is not empty' do
        expect(described_class.by_week(1, 2017)).to_not be_empty
      end
    end
  end
end
