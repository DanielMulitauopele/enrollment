require 'rails_helper'

describe 'as a user' do
  describe 'user can see a single student' do
    it 'should display the name of the student' do
      student = Student.create(name: "Jimmy Jacobs")

      visit student_path(student)

      expect(page).to have_content("Student Name: #{student.name}")
    end
  end
end
