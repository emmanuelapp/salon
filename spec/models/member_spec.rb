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
      subject { build(:member, first_name: nil) }

      it 'is invalid' do
        error = ['First name can\'t be blank']

        expect do
          subject.valid?
        end.to change { subject.errors.full_messages }.by(error)
      end
    end

    context 'when last_name is nil' do
      subject { build(:member, last_name: nil) }

      it 'is invalid' do
        error = ['Last name can\'t be blank']

        expect do
          subject.valid?
        end.to change { subject.errors.full_messages }.by(error)
      end
    end

    context 'when description is nil' do
      subject { build(:member, description: nil) }

      it 'is invalid' do
        error = ['Description can\'t be blank']

        expect do
          subject.valid?
        end.to change { subject.errors.full_messages }.by(error)
      end
    end

    context 'when profession is nil' do
      subject { build(:member, profession: nil) }

      it 'is invalid' do
        error = ['Profession can\'t be blank']

        expect do
          subject.valid?
        end.to change { subject.errors.full_messages }.by(error)
      end
    end
  end

  describe '#full_name' do
    context 'when user is named Jack Daniels' do
      subject { create(:member) }

      it 'returns Jack Daniels' do
        expect(subject.full_name).to eq 'Jack Daniels'
      end
    end
  end
end
