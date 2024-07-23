class Leaveslist < ApplicationRecord
  belongs_to :employeelist
 validates :employeelist, presence: true

 

end
