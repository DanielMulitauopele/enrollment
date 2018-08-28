require 'rails_helper'

describe 'validations' do
  it 'should be invalid without a name' do
    course = Course.create()

    expect(course).to_not be_valid
  end
end
describe "relationships" do
  it "has many students" do
    course = Course.new(name: "Computer Science")
    expect(course).to respond_to(:students)
  end
end
