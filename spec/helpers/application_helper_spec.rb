require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#no_content_message' do
    context 'when empty collection is given' do
      it 'returns h4 header' do
        expect(helper.no_content_message([])).to eq '<h4>No content</h4>'
      end
    end

    context 'when a nonempty collection is given' do
      it 'returns nil' do
        expect(helper.no_content_message([1])).to be_nil
      end
    end
  end
end
