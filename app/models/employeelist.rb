class Employeelist < ApplicationRecord
	
      has_many :leaveslists, foreign_key: 'employeelist_id'
     before_save :calculate_salaries

      STATUS_INACTIVE = 0
  STATUS_ACTIVE = 1

  def status_text
    status == STATUS_ACTIVE ? 'Active' : 'Inactive'
  end

  validates :salary, presence: true, numericality: { greater_than: 0 }
  validates :extra_leaves, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :deductions, numericality: { allow_nil: true }
  validates :adjusted_salary, numericality: { allow_nil: true }
  validates :total_annual_salary, numericality: { allow_nil: true }
 
  def update_extra_leaves(new_extra_leaves)
    self.extra_leaves = new_extra_leaves
    calculate_salaries
    save
  end

  

   def calculate_salaries
    extra_leaves = self.extra_leaves.to_f
    salary = self.salary.to_f

    if extra_leaves > 11
      extra_leaves_compensation = salary * 0.05 * extra_leaves
      self.status = STATUS_INACTIVE # Set status to inactive
    else
      extra_leaves_compensation = salary * 0.025 * extra_leaves
      self.status = STATUS_ACTIVE # Set status to active
    end

    self.deductions = extra_leaves_compensation
    self.adjusted_salary = salary - extra_leaves_compensation
    self.total_annual_salary = salary * 12
    self.salary_disbursed = self.adjusted_salary * 7
end

 



  def name
    "#{first_name} #{last_name}"
  end

end

