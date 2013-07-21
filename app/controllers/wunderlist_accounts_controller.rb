require 'wunderlist'

class WunderlistAccountsController < ApplicationController
  def index
    @account = current_user.wunderlist_account
    @signed_in = !@account.nil?
    unless @signed_in
      @account = WunderlistAccount.new
    end
  end

  def create
    params = account_params
    wunderlist = Wunderlist.new
    result = wunderlist.login params['email'], params['password']
    if result['errors']
      @failed = true
      render 'index'
    else
      @account = current_user.build_wunderlist_account 
      @account.email = params['email']
      @account.token = result['token']
      @account.save
      redirect_to wunderlist_accounts_path
    end
  end

  def update
    @account = current_user.wunderlist_account
    params = account_params
    wunderlist = Wunderlist.new
    result = wunderlist.login params['email'], params['password']
    if result['errors']
      @failed = true
      render 'index'
    else
      @account.email = params['email']
      @account.token = result['token']
      @account.save
      redirect_to wunderlist_accounts_path
    end
  end

  private
    def account_params
      params.require(:wunderlist_account).permit :email, :password
    end
end
