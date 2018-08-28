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
  end
end
