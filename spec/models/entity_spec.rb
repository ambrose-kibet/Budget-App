require 'rails_helper'

RSpec.describe Entity, type: :model do
  subject do
    Entity.new(name: 'appple', amount: 'https://img.icons8.com/?size=512&id=FMPXwiWsNx4v&format=png')
  end

  before { subject.save }
  it 'should have a name present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have an amount present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'should have a amount greater than 0' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end

  describe 'associations' do
    it 'belongs to user' do
      entity = Entity.reflect_on_association(:user)
      expect(entity.macro).to eq(:belongs_to  )
    end

     it 'hasand belongs to many  groups' do
      entity = Entity.reflect_on_association(:groups)
      expect(entity.macro).to eq(:has_and_belongs_to_many  )
    end
  end
end
