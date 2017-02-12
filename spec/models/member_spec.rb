require 'rails_helper'

RSpec.describe Member, type: :model do
  subject { create(:member) }

  describe 'validations' do
    context 'when names, description and profession are given' do
      it 'has a valid factory' do
        expect(subject).to be_valid
      end
    end

    context 'when first_name is nil' do
      let(:attributes) { attributes_for(:member).merge(first_name: nil) }

      subject { described_class.new(attributes) }

      it 'is invalid' do
        error = ['First name can\'t be blank']

        expect do
          subject.valid?
        end.to change { subject.errors.full_messages }.by(error)
      end
    end

    context 'when last_name is nil' do
      let(:attributes) { attributes_for(:member).merge(last_name: nil) }

      subject { described_class.new(attributes) }

      it 'is invalid' do
        error = ['Last name can\'t be blank']

        expect do
          subject.valid?
        end.to change { subject.errors.full_messages }.by(error)
      end
    end

    context 'when description is nil' do
      let(:attributes) { attributes_for(:member).merge(description: nil) }

      subject { described_class.new(attributes) }

      it 'is invalid' do
        error = ['Description can\'t be blank']

        expect do
          subject.valid?
        end.to change { subject.errors.full_messages }.by(error)
      end
    end

    context 'when profession is nil' do
      let(:attributes) { attributes_for(:member).merge(profession: nil) }

      subject { described_class.new(attributes) }

      it 'is invalid' do
        error = ['Profession can\'t be blank']

        expect do
          subject.valid?
        end.to change { subject.errors.full_messages }.by(error)
      end
    end
  end
end
