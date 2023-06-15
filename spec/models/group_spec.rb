require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    Group.new(name: 'appple', icon: 'https://img.icons8.com/?size=512&id=FMPXwiWsNx4v&format=png')
  end

  before { subject.save }
  it 'should have a name present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have an icon present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'should have a name greater than 3 chars' do
    subject.name = '1'
    expect(subject).to_not be_valid
  end

  describe 'associations' do
    it 'belongs to user' do
      group = Group.reflect_on_association(:user)
      expect(group.macro).to eq(:belongs_to)
    end

    it 'hasand belongs to many  entities' do
      group = Group.reflect_on_association(:entities)
      expect(group.macro).to eq(:has_and_belongs_to_many)
    end
  end
end
