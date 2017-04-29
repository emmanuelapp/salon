require 'rails_helper'

RSpec.describe Queries::OfferMember do
  let(:member) { create:member }
  let!(:offer) { create(:offer, member: member) }

  describe '.all' do
    subject { described_class.all.to_a }

    it 'returns a collection' do
      expect(subject).to be_an_instance_of(Array)
    end

    it 'returns the expected size' do
      expect(subject.size).to eq 1
    end

    it 'has the expected keys for each hash' do
      keys = %w[first_name id last_name name price]
      expect(subject.last.attributes.keys).to contain_exactly(*keys)
    end
  end
end
