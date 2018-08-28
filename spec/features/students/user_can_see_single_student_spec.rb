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
    it 'should be able to see all addresses' do
      student = Student.create(name: "Jeffrey Johns")
      address_1 = student.addresses.create(id: 1, street: "Detroit St.", city: "Denver", state: "CO", zip: 80206, student_id: student.id)
      address_2 = student.addresses.create(id: 2, street: "Vale St.", city: "Beaver Creek", state: "CO", zip: 80777, student_id: student.id)

      visit student_path(student)
  
      within ".address-1" do
        expect(page).to have_content("Detroit St.")
        expect(page).to have_content("Denver")
        expect(page).to have_content("CO")
        expect(page).to have_content(80206)
      end
      within ".address-2" do
        expect(page).to have_content("Vale St.")
        expect(page).to have_content("Beaver Creek")
        expect(page).to have_content("CO")
        expect(page).to have_content(80777)
      end
    end
  end
end
