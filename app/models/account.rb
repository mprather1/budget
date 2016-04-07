class Account < ActiveRecord::Base

  has_one :record

  belongs_to :user
  before_create :build_default_records
  def debit(amount)
    Account.where('user_id = ?', self.user_id).first.decrement!(:balance, by = amount.to_i)
    Account.where('user_id = ?', self.user_id).first.update_attributes!(recorded: DateTime.now)
  end

  def credit(amount)
    Account.where('user_id = ?', self.user_id).first.increment!(:balance, by = amount.to_i)
    Record.where('account_id = ?', id).first.update_attributes!(recorded: DateTime.now)
  end
  private

  def build_default_records
    build_record
    true
  end
end
