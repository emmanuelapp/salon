require 'rails_helper'

RSpec.describe BookingsHelper, type: :helper do
  describe '#reserved_at_prompt' do
    it 'holds the expected keys' do
      expect(helper.reserved_at_prompt.keys).to contain_exactly(:day, :hour, :minute, :month, :year)
    end
  end

  describe '#reserved_at_html_options' do
    it 'holds the expected output' do
      expect(helper.reserved_at_html_options).to eq(class: "form-control", required: true)
    end
  end

  describe '#full_name' do
    let(:booking) { create(:booking, offer_ids: []) }

    it 'returns the contatenation of first and last names' do
      expect(helper.full_name(booking)).to eq 'Jack Daniels'
    end
  end
end
