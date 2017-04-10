require 'rails_helper'

RSpec.describe BookingForm do
  describe '.model_name' do
    it 'is an instance_of ActiveModel::Name' do
      expect(described_class.model_name).to be_an_instance_of ActiveModel::Name
    end

    it 'has Booking as its model name value' do
      expect(described_class.model_name.to_s).to eq 'Booking'
    end
  end

  describe '#save' do
    subject { described_class.new(attributes) }

    context 'when first_name is missing' do
      let(:attributes) do
        {
          'last_name' => 'Lastname',
          'phone' => '1234567890',
          'additional_info' => 'Lorem Ipsum',
          'reserved_at(3i)' => '1',
          'reserved_at(2i)' => '1',
          'reserved_at(1i)' => '2017',
          'reserved_at(4i)' => '00',
          'reserved_at(5i)' => '00'
        }
      end

      xit 'is invalid' do
        expect(subject).to be_invalid
      end
    end

    context 'when last_name is missing' do
      let(:attributes) do
        {
          'first_name' => 'Firstname',
          'phone' => '1234567890',
          'additional_info' => 'Lorem Ipsum',
          'reserved_at(3i)' => '1',
          'reserved_at(2i)' => '1',
          'reserved_at(1i)' => '2017',
          'reserved_at(4i)' => '00',
          'reserved_at(5i)' => '00'
        }
      end

      xit 'is invalid' do
        expect(subject).to be_invalid
      end
    end

    context 'when phone is missing' do
      let(:attributes) do
        {
          'first_name' => 'Firstname',
          'last_name' => 'Lastname',
          'additional_info' => 'Lorem Ipsum',
          'reserved_at(3i)' => '1',
          'reserved_at(2i)' => '1',
          'reserved_at(1i)' => '2017',
          'reserved_at(4i)' => '00',
          'reserved_at(5i)' => '00'
        }
      end

      xit 'is invalid' do
        expect(subject).to be_invalid
      end
    end

    context 'when additional_info is missing' do
      let(:attributes) do
        {
          'first_name' => 'Firstname',
          'last_name' => 'Lastname',
          'phone' => '1234567890',
          'reserved_at(3i)' => '1',
          'reserved_at(2i)' => '1',
          'reserved_at(1i)' => '2017',
          'reserved_at(4i)' => '00',
          'reserved_at(5i)' => '00'
        }
      end

      xit 'is valid' do
        expect(subject).to be_valid
      end
    end

    context 'when all attributes are present' do
      let(:attributes) do
        {
          'first_name' => 'Firstname',
          'last_name' => 'Lastname',
          'phone' => '1234567890',
          'additional_info' => 'Lorem Ipsum',
          'reserved_at(3i)' => '1',
          'reserved_at(2i)' => '1',
          'reserved_at(1i)' => '2017',
          'reserved_at(4i)' => '00',
          'reserved_at(5i)' => '00'
        }
      end

      xit 'is valid' do
        expect(subject).to be_valid
      end
    end
  end
end
