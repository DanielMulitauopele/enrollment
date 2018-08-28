require 'rails_helper'

describe 'validations' do
  it 'should be invalid without a name' do
    student = Student.create()

    expect(student).to_not be_valid
  end
end
describe "relationships" do
  it "has many addresses" do
    student = Student.new(name: "Charlie Chuck")
    expect(student).to respond_to(:addresses)
  end
  it "has many courses" do
    student = Student.new(name: "Charlie Chuck")
    expect(student).to respond_to(:courses)
  end
end
