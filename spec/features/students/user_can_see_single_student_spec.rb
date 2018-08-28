require 'rails_helper'

describe 'as a user' do
  describe 'user can see a single student' do
    it 'should display the name of the student' do
      student = Student.create(name: "Jimmy Jacobs")

      visit student_path(student)

      expect(page).to have_content("Student Name: #{student.name}")
    end
    it 'should be able to link to create student page' do
      student = Student.create(name: "Jimmy Jacobs")

      visit student_path(student)

      click_link "Create a New Student!"
      expect(current_path).to eq(new_student_path)
    end
    it 'should be able to link to all students page' do
      student = Student.create(name: "Jimmy Jacobs")

      visit student_path(student)

      click_link "See All Students!"
      expect(current_path).to eq(students_path)
    end
  end
end
