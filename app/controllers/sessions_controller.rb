class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logeado Correctamente"
    else
      flash.now[:notice] = 'Email o Password inválida'
      render action: :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Singed out successfully'
  end
end
