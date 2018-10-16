require 'rails_helper'


RSpec.describe Event, type: :model do
  it 'should persist an Event' do
    Event.create(title_event: 'New baby event', description: 'nice weather', location: 'Bondi beach', organiser_id: 1, user_id: 1)
    expect(Event.count).to eq(1)
  end
end
