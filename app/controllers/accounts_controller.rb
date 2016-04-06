class AccountsController < ApplicationController

   before_action :confirm_logged_in



  #before_action :correct_account, only: [:edit, :update, :show]


  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to account_path(@account)
    else
      render 'new'
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])

    if @account.update_attributes(account_params)
      redirect_to account_path(@account)
    else
      render 'edit'
    end
  end

  def delete
    @account = Account.find(params[:id])
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to accounts_path
  end

  def debit
    @user = User.find(current_user.id)
    @account = Account.find(current_user.id)
    if params[:trans]
      #@account.balance - params[:trans].to_i

      @account.decrement!(:balance, by = params[:trans].to_i)
      @account.update_attributes(recorded: Time.now)
      #Account.update_all(@account.recorded = Time.now.to_s)

      #Account.update_all(@account.balance = (@account.balance - params[:trans].to_i).to_s)
      redirect_to account_path(@user)
    else
      render 'show'
    end
  end

  def credit
    @user = User.find(current_user.id)
    @account = Account.find(current_user.id)
    if params[:trans]
      #@account.balance - params[:trans].to_i

      @account.increment!(:balance, by = params[:trans].to_i)
      @account.update_attributes(recorded: Time.now)

      #Account.update_all(@account.balance = (@account.balance - params[:trans].to_i).to_s)
      redirect_to account_path(@user)
    else
      render 'show'
    end
  end

  private

  def account_params
    params.require(:account).permit(:account_number, :balance, :trans, :recorded)
  end

end
