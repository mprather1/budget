class Account < ActiveRecord::Base
  attr_accessor :trans, :transaction_amount, :note
  has_one :record

  belongs_to :user


  def debit(amount)
    Account.where('user_id = ?', self.user_id).first.decrement!(:balance, by = amount.to_f)
    Account.where('user_id = ?', self.user_id).first.update_attributes!(record_dates: self.record_dates + [DateTime.now], records: self.records + ["Debit"], amounts: self.amounts + [self.transaction_amount.to_f], memos: self.memos + [self.note])
  end

  def credit(amount)
    Account.where('user_id = ?', self.user_id).first.increment!(:balance, by = amount.to_f)
    Account.where('user_id = ?', self.user_id).first.update_attributes!(record_dates: self.record_dates + [DateTime.now], records: self.records + ["Credit"], amounts: self.amounts + [self.transaction_amount.to_f], memos: self.memos + [self.note])
  end

end
