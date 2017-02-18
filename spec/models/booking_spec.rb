require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe 'validations' do
    shared_examples 'an invalid booking instance' do
      before(:each) { subject.valid? }

      subject { build(:booking, attribute => nil) }

      it 'is invalid' do
        expect(subject).to_not be_valid
      end

      it 'has the expected error message' do
        attribute_blank_error = { attribute => ["can't be blank"] }
        expect(subject.errors.messages).to include(attribute_blank_error)
      end
    end

    context 'when first_name is blank' do
      it_behaves_like 'an invalid booking instance' do
        let(:attribute) { :first_name }
      end
    end

    context 'when last_name is blank' do
      it_behaves_like 'an invalid booking instance' do
        let(:attribute) { :last_name }
      end
    end

    context 'when reserved_at is blank' do
      it_behaves_like 'an invalid booking instance' do
        let(:attribute) { :reserved_at }
      end
    end

    context 'when phone is blank' do
      it_behaves_like 'an invalid booking instance' do
        let(:attribute) { :phone }
      end
    end
  end
end
