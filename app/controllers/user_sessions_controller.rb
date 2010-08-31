class UserSessionsController < ApplicationController

  layout 'login'

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_back_or_default(numbers_url)
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:success] = "Logout efetuado com sucesso!"
    redirect_to login_url
  end

end

