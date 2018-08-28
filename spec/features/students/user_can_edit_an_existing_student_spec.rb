require 'rails_helper'

describe 'as a user' do
  describe 'user visits edit page' do
    it 'should edit existing user' do
      student = Student.create(name: "Jimmy Jacobs")

      visit edit_student_path(student)
      expect(page).to have_content("Edit Student")

      fill_in "student[name]", with: "Jenny Jills"

      click_on "Update Student"

      expect(current_path).to eq(student_path(student))
      expect(page).to have_content("Jenny Jills")
    end
    it 'should be able to link to create student page' do
      student = Student.create(name: "Jimmy Jacobs")
      visit edit_student_path(student)

      click_link "Create a New Student!"
      expect(current_path).to eq(new_student_path)
    end
    it 'should be able to link to all students page' do
      student = Student.create(name: "Jimmy Jacobs")
      visit edit_student_path(student)

      click_link "See All Students!"
      expect(current_path).to eq(students_path)
    end
  end
end
