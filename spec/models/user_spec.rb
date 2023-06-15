require 'rails_helper'

RSpec.describe User, type: :model do
 subject do
    User.new(name: 'appple', email: 'grams@mail.net', password:'123456')
  end

  before { subject.save }
  it 'should have a name present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have an email present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'should have a password greater than 6 chars' do
    subject.password = '123'
    expect(subject).to_not be_valid
  end

  describe 'associations' do
    it 'has many groups' do
      user = User.reflect_on_association(:groups)
      expect(user.macro).to eq(:has_many )
    end

     it 'has many entities' do
      user = User.reflect_on_association(:entities)
      expect(user.macro).to eq(:has_many )
    end
  end
end
