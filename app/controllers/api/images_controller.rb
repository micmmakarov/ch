class Api::ImagesController < ApplicationController
  def index
    @images = Image.all
    render json: @images
  end

  def show
    @image = Image.find(params[:id])
    render json: @image
  end

  def create
    @image = Image.new(params[:image])
    @image.user_id = current_user.id
    if @image.save
      render json: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    params[:image].delete :created_at
    params[:image].delete :updated_at
    params[:image].delete :id
    @image = Image.find(params[:id])
    if @image.update_attributes(params[:image])
      render json: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    image = Image.find(params[:id])
    if image.user_id == current_user.id
      image.destroy
      render json:{}, status:201
    end
  end
end
