class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  
  def new
    redirect_to user_path(current_user) if current_user
  end

  def destroy
    session.delete(:user_id)
    flash[:danger] = "Déconnecté"
    redirect_to new_session_path
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Bienvenue sur votre profil de facebook clone"
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = "Echec connexion. E-mail ou mot de passe incorrect"
      render "sessions/new"
    end
  end
end
