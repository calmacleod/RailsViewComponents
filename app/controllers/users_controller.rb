class UsersController < ApplicationController
  before_action :set_user, only: :show

  def index
    render Views::User::Index.new(users: User.all)
  end

  def show
    render Views::User::Show.new(user: @user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
