class Plan < ApplicationRecord
  

  def unlimited?
    no_users == -1 ? true : false
  end
end
