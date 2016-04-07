class User < ActiveRecord::Base
  has_secure_password validations: false

  has_one :account
  before_create :build_default_account
  #  validates_presence_of :password, :on => :create
#  validates_presence_of :password_confirmation
#  validates_confirmation_of :password_confirmation

  def name
    "#{first_name} #{last_name}"
  end

#  def create_account
#    @account.create(account_number: "#{Faker::Number.number(10)}", balance: 0, user_id: current_user.id
#  end
private

  def build_default_account
    build_account
    true
  end
end
