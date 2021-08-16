class UsersController < ApplicationController
    skip_before_action :login_required, only: [:new, :create]

    def new
        @user = User.new
        redirect_to user_path(current_user) if current_user
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to action: "show", id: @user.id
            flash[:success] = "Compte créé avec succès. Veuillez vous connecter"
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :surname, :sexe, :email, :password, :password_confirmation)
    end
end
