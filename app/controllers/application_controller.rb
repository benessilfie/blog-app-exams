class ApplicationController < ActionController::Base
    before_action :authenticate_user

    def authenticate_user
        @user = User.find(session[:user]) if session[:user]
        @user_signed_in = @user.present?
        @current_user = @user
    end

    def requires_login
        redirect_to sign_in_path, notice: "You need sign in" unless @user_signed_in
    end

    def requires_guest
        redirect_to root_path, notice: "You are already signed in" if @user_signed_in
    end
end
