class UsersController < ApplicationController
  def index
    @list_of_users = User.order({ :created_at => :desc })
    render({ :template => "users/index" })
  end

  def show
    @the_user = User.find_by(username: params.fetch("username"))
    if @the_user.nil?
      redirect_to "/users", alert: "User not found."
    else
      render({ :template => "users/show" })
    end
  end

  def create
    the_user = User.new(user_params)
    if the_user.save
      redirect_to("/users", { :notice => "User created successfully." })
    else
      redirect_to("/users", { :alert => the_user.errors.full_messages.to_sentence })
    end
  end

  def update
    the_user = User.find(params.fetch("path_id"))
    if the_user.update(user_params)
      redirect_to("/users/#{the_user.username}", { :notice => "User updated successfully." })
    else
      redirect_to("/users/#{the_user.username}", { :alert => the_user.errors.full_messages.to_sentence })
    end
 end

  def destroy
    the_user = User.find(params.fetch("path_id"))
    the_user.destroy
    redirect_to("/users", { :notice => "User deleted successfully." })
  end

  private

  def user_params
    params.permit(:username, :email, :encrypted_password, :private, :comments_count, :likes_count, :remember_created_at, :reset_password_sent_at, :reset_password_token)
  end
end
