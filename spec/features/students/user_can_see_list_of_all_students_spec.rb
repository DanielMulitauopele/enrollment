require 'rails_helper'

describe 'as a user' do
  describe 'user can see list of all students' do
    it 'should show the list of every student' do
      student_1 = Student.create(name: "Jimmy Jacobs")
      student_2 = Student.create(name: "Billy Bobs")

      visit students_path

      expect(page).to have_content(student_1.name)
      expect(page).to have_content(student_2.name)
    end
    it 'should link to individual student page through link' do
      student_1 = Student.create(name: "Jimmy Jacobs")
      student_2 = Student.create(name: "Billy Bobs")

      visit students_path
      expect(page).to have_link(student_1.name)
      
      click_link "Jimmy Jacobs"
      expect(current_path).to eq(student_path(student_1))
    end
    it 'should be able to link to create student page' do
      student = Student.create(name: "Jimmy Jacobs")
      visit students_path

      click_link "Create a New Student!"
      expect(current_path).to eq(new_student_path)
    end
    it 'should be able to link to all students page' do
      student = Student.create(name: "Jimmy Jacobs")
      visit students_path

      click_link "See All Students!"
      expect(current_path).to eq(students_path)
    end
  end
end
