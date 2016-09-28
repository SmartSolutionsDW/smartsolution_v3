class AdministratorLocal < ActiveRecord::Base
  belongs_to :employee
  belongs_to :local
end
