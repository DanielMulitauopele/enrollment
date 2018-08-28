class Address < ApplicationRecord
  validates_presence_of :street, :city, :state, :zip, :student_id
  belongs_to :student
end
