class AccountsController < ApplicationController

  before_action :confirm_logged_in

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
    @account.transaction_amount =  params[:trans]
    @account.note = params[:note]
    @account.debit(params[:trans])
    redirect_to account_path(@user)
  end

  def credit
    @user = User.find(current_user.id)
    @account = Account.find(current_user.id)
    @account.transaction_amount =  params[:trans]
    @account.note = params[:note]
    @account.credit(params[:trans])
    redirect_to account_path(@user)
  end

  private

  def account_params
    params.require(:account).permit(:account_number, :balance, :trans, :transaction_amount, :note, record_dates: [], records: [], amounts: [], memos: [])
  end

end
