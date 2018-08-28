require 'rails_helper'

describe 'as a user' do
  describe 'user visits address new page' do
    it 'should be able to create a new address' do
      student = Student.create(name: "Jeffrey Johns")
      visit new_student_address_path(student)

      fill_in "address[street]", with: "Clayton St."
      fill_in "address[city]", with: "Denver"
      fill_in "address[state]", with: "CO"
      fill_in "address[zip]", with: 80206

      click_on "Create"

      expect(current_path).to eq(student_path(student))
      expect(page).to have_content("Clayton St.")
      expect(page).to have_content("Denver")
      expect(page).to have_content("CO")
      expect(page).to have_content(80206)
    end
  end
end
