class Admin < ApplicationRecord
  validate :password_complexity

  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  def password_complexity
    if password.present?
      # test if a given string contains at least a lowercase letter, a uppercase, a digit, a special char and 8+ chars
     if !password.match(/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[\W]).{8,}$/) 
       errors.add :password, "Password complexity requirement not met"
     end
    end
  end
  
end
