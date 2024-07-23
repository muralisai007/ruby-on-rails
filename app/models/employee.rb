
class Employee < ApplicationRecord
	
  before_save :total_salary
  paginates_per 20
  # Validations
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :phone_no, presence: true, format: { with: /\A\d{10}\z/, message: "must be exactly 10 digits" }
validates :email, presence: true, format: { with: /\A[\w+\-.]+@gmail\.com\z/i, message: "must be a valid Gmail address" }

  validates :date_of_birth, presence: true
  validates :aadhaar_input, presence: true, format: { with: /\A\d{12}\z/, message: "must be exactly 12 digits" }
  validates :designation, presence: true
  validates :salary, presence: true, numericality: { greater_than_or_equal_to: 0 }
 validates :status, presence: true, inclusion: { in: [0, 1] }

  scope :active, -> { where(status: 1) }
  scope :inactive, -> { where(status: 0) }
  end
  
   
 def total_salary
    salary * 12
  end








