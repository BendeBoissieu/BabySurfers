require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should persist a User' do
    User.create(email: 'a@a.a', encrypted_password: '123456')
    expect(User.count).to eq(1)
  end
end
