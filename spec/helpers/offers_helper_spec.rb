require 'rails_helper'

RSpec.describe OffersHelper, type: :helper do
  describe '#format_price' do
    context 'when offer price is 123.999999' do
      let(:offer) { create(:offer, price: 123.999999) }

      it 'returns 124.00 BGN' do
        expect(helper.format_price(offer)).to eq '124.00 BGN'
      end
    end

    context 'when offer price is 123.9' do
      let(:offer) { create(:offer, price: 123.9) }

      it 'returns 123.90 BGN' do
        expect(helper.format_price(offer)).to eq '123.90 BGN'
      end
    end

    context 'when offer price is empty' do
      let(:offer) { create(:offer) }

      it 'returns 0.00 BGN' do
        expect(helper.format_price(offer)).to eq '0.00 BGN'
      end
    end
  end

  describe '#selection_tuples' do
    context 'when Member.count is zero' do
      before(:each) { Member.delete_all }

      it 'returns an empty array' do
        expect(helper.selection_tuples).to eq []
      end
    end

    context 'when Member has data in its table' do
      let!(:member) { create(:member) }

      it 'holds the expected tuple' do
        expect(helper.selection_tuples).to include(['Jack Daniels', member.id])
      end
    end
  end
end
