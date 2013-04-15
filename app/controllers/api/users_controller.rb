class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find_by_slug(params[:id])
    @user = User.find(params[:id]) if @user.blank?
    render json: @user.to_json(include_hash)
  end

  def update
    @user = current_user
    params[:user].delete :created_at
    params[:user].delete :updated_at
    params[:user].delete :id
    params[:user].delete :events
    if params[:user]['featured_video']
      @user.videos.create(youtube_id:params[:user]['featured_video'], featured:true)
      params[:user].delete 'featured_video'
    end
    #@user = User.find(params[:id])
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
  def include_hash
    {:include => {:events => {:include => {:venue => {:include => :place}}}}, :methods => [:featured_video, :next_show]}
  end
end
