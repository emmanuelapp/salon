require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe '#to_s' do
    subject { create(:offer_with_name_and_price) }

    it 'returns the expected string' do
      expect(subject.to_s).to eq '12.22 - Relaxing massage'
    end

    it 'is an instance of String' do
      expect(subject.to_s).to be_an_instance_of(String)
    end
  end
end
