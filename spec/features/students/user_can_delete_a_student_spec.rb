require 'rails_helper'

describe 'as a user' do
  describe 'user visits the index page' do
    it 'should be able to delete a single student' do
      student_1 = Student.create(id: 1, name: "Jimmy Jacobs")
      student_2 = Student.create(id: 2, name: "Billy Bobs")
      student_3 = Student.create(id: 3, name: "Sammy Stephens")

      visit students_path

      within ".student-1" do
        click_link "Delete"
      end

      expect(page).to_not have_content("Jimmy Jacobs")
      expect(page).to have_content("Billy Bobs")
      expect(page).to have_content("Sammy Stephens")
    end
  end
end
