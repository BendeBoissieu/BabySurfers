require 'rails_helper'

context 'Profile association' do
  it 'should increment profiles_count' do
      user = User.new(email: 'a@.a', encrypted_password: '123456')
      user.profile << Profile.new(phone: '064858693049')
      user.save
      expect (Profile.count).to eq(1)
      expect (User.profiles_count).to eq(1)
  end
end

context 'Event association' do
  it 'should increment events_count' do
    user = User.new(email: 'a@.a', encrypted_password: '123456')
    user.events << Event.new(title_event: 'New baby event', description: 'nice weather', location: 'Bondi beach')
    user.save
    expect (Event.count).to eq(1)
    expect (User.events_count).to eq(1)
  end
end

RSpec.describe User, type: :model do
  it 'should persist a User' do
    User.create(email: 'a@a.a', encrypted_password: '123456')
    expect(User.count).to eq(1)
  end
end
