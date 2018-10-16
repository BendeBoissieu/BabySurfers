require 'rails_helper'

RSpec.describe Discussion, type: :model do
  context 'validation' do
    it 'should validate discussion length' do
      discussion = Discussion.new(message_event: 'aze')
      expect(discussion.valid?).to be true
    end
  end
end
