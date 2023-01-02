class Office < ApplicationRecord
  has_many :cars, :dependent => :destroy
  validate :password_complexity

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def password_complexity
    if password.present?
     if !password.match(/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[\W]).{8,}$/) 
       errors.add :password, "complexity requirement not met"
     end
    end
  end

end
