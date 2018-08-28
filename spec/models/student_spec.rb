require 'rails_helper'

describe 'validations' do
  it 'should be invalid without a name' do
    student = Student.create()

    expect(student).to_not be_valid
  end
end
