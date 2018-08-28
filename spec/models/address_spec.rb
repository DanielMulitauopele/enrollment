require 'rails_helper'

describe 'validations' do
  it 'should be invalid without a street' do
    student = Student.create(name: "Daniel Muli")
    address = student.addresses.create(city: "Denver", state: "CO", zip: 80206, student_id: student.id)

    expect(address).to_not be_valid
  end
  it 'should be invalid without a city' do
    student = Student.create(name: "Daniel Muli")
    address = student.addresses.create(street: "Detroit St", state: "CO", zip: 80206, student_id: student.id)

    expect(address).to_not be_valid
  end
  it 'should be invalid without a state' do
    student = Student.create(name: "Daniel Muli")
    address = student.addresses.create(city: "Denver", street: "Detroit St", zip: 80206, student_id: student.id)

    expect(address).to_not be_valid
  end
  it 'should be invalid without a zip code' do
    student = Student.create(name: "Daniel Muli")
    address = student.addresses.create(city: "Denver", state: "CO", street: "Detroit St", student_id: student.id)

    expect(address).to_not be_valid
  end
  it 'should be valid with all attributes' do
    student = Student.create(name: "Daniel Muli")
    address = student.addresses.create(city: "Denver", state: "CO", zip: 80206, street: "Detroit St")

    expect(address).to be_valid
  end
end

describe "relationships" do
  it "belongs to student" do
    address = Address.create(city: "Denver", state: "CO", zip: 80206)
    expect(address).to respond_to(:student)
  end
end
