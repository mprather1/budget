class User < ActiveRecord::Base
  has_secure_password validations: false
  
  #  validates_presence_of :password, :on => :create
#  validates_presence_of :password_confirmation
#  validates_confirmation_of :password_confirmation
  
  def name
    "#{first_name} #{last_name}"
  end
end
