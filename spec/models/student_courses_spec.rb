require 'rails_helper'

describe "relationships" do
  it "has many students" do
    student_course = StudentCourse.new
    expect(student_course).to respond_to(:students)
  end
  it "has many courses" do
    student_course = StudentCourse.new
    expect(student_course).to respond_to(:courses)
  end
end
