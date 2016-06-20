class UsersController < ApplicationController

#present all users
  def index
  	#the @ sign allows you to carry over that data into the index page.
    @users = User.all
	  render :index
  end

  def new
  	#new user being created to render in the 'new' form.
  	@user = User.new
  	render :new
  end

  def create
  	#here we are requiring given parameters
  	user_params = params.require(:user).permit(:first_name, :last_name, :email, :password)
  	@user = User.create(user_params)
  	login(@user) # used to log in user.
  	redirect_to "/users/#{@user.id}" # goes to the users page and follows that id logged in to that page.
  end

  def show
  	@user = User.find(params[:id])
  	render :show
  end

end
