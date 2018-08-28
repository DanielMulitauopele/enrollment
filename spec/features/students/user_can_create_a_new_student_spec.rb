require 'rails_helper'

describe 'as a user' do
  describe 'user visits new page' do
    it 'should create a new student' do
      visit new_student_path

      expect(page).to have_content("Create New Student")
      fill_in "student[name]", with: "Jenny Jills"

      click_button "Create"
      
      expect(current_path).to eq(student_path(Student.last))
      expect(Student.count).to eq(1)
    end
  end
end
