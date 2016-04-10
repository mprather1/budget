class Account < ActiveRecord::Base

  has_one :record

  belongs_to :user


  def debit(amount)
    Account.where('user_id = ?', self.user_id).first.decrement!(:balance, by = amount.to_i)
    Account.where('user_id = ?', self.user_id).first.update_attributes!(record_dates: self.record_dates + [DateTime.now])
    Account.where('user_id = ?', self.user_id).first.update_attributes!(records: self.records + ["Debit"])

    #array_append(Account.where('user_id = ?', self.user_id)first.records.push(DateTime.now)

  end

  def credit(amount)
    Account.where('user_id = ?', self.user_id).first.increment!(:balance, by = amount.to_i)
    Account.where('user_id = ?', self.user_id).first.update_attributes!(record_dates: self.record_dates + [DateTime.now])
    Account.where('user_id = ?', self.user_id).first.update_attributes!(records: self.records + ["Credit"])

  end

end
