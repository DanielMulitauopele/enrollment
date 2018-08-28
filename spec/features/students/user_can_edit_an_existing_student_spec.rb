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
  end
end
