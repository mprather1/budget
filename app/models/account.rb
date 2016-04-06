class Account < ActiveRecord::Base

  belongs_to :user
   def current_user
    @current_user = @current_user || User.find_by(id: session[:user_id])
  end

    def debt(x)
    
      Account.where('user_id = ?', self.user_id).first.decrement!(:balance, by = x.to_i)
     # Account.where('user_id = ?', self.user_id).update_attributes!(recorded: DateTime.now)
     # Account.where('user_id = ?', self.user_id).touch

      #Account.find(1).update_attributes(recorded: DateTime.now)
     # @account.update_attributes(recorded: Time.now)
      #@cars = @cars.where('manufacturer_id = ?', params[:filter_manufacturer]) if not params[:filter_manufacturer].blank?



  end
end
