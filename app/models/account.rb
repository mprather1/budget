class Account < ActiveRecord::Base
  extend ActiveModel::Callbacks
  define_model_callbacks :debit

  before_debit :build_default_records

  has_many :records

  belongs_to :user
  #before_create :build_default_records

  #before_action :build_default_records, only: [:debit, :credit]

  def debit(amount)
    run_callbacks :debit do
    Account.where('user_id = ?', self.user_id).first.decrement!(:balance, by = amount.to_i)
    Account.where('user_id = ?', self.user_id).first.update_attributes!(recorded: DateTime.now)
  end
  end

  def credit(amount)
    Account.where('user_id = ?', self.user_id).first.increment!(:balance, by = amount.to_i)
    #Record.where('account_id = ?', id).first.update_attributes!(recorded: DateTime.now)
  end
  private

  def build_default_records
    build_records
    true
  end
end
