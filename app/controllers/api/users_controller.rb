class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    if params[:slug]
      @user = User.find_by_slug(params[:slug])
    else
      @user = User.find(params[:id])
    end
    render json: @user
  end

  def update
    params[:user].delete :created_at
    params[:user].delete :updated_at
    params[:user].delete :id
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      render json: @user.to_json
    else
      head :no_content
    end
  end

  def create
    @user = User.new(params[:user])
    @user.save!
    render json: @user
  end

  def destroy

  end
private
  def include_has
    {:include => {:hello => {:only => :hi}}}
  end
end
