module V1
  class UsersController <  ApplicationController
    def create
      @user = User.new(users_params)

      if @user.save
        render :create
      else
        head(:unprocessable_entity)
      end
    end

    private

    def users_params
      params.require(:users).permit(:email, :password, :password_confirmation)
    end

  end
end