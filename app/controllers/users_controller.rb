class UsersController < ApplicationController

    def new
        @user = User.new
    end
    
    def create
      @user = User.new user_params
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Logged In!"
      else
        render :new
      end
    end

    def show
       @user = current_user
    end

    def edit
      @user = current_user
      puts @user
    end
    
    def update
      @user = current_user
      
      if @user.update(user_params)
        flash[:success] = "username/password successfully updated"
        redirect_to edit_user_path @user , notice: "Logged In!"
      

      else
        flash[:error] = "Something went wrong"
        render :edit
      end
    end  
      
    
      private
    
    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation
      )
    end

end
