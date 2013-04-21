class Api::LinksController < ApplicationController
  def index
    @links = Link.all
    render json: @links
  end

  def show
    @link = Link.find(params[:id])
    render json: @link
  end

  def create
    @link = Link.new(params[:link])
    @link.user_id = current_user.id
    if @link.save
      render json: @link
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  # PUT /links/1
  # PUT /links/1.json
  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(params[:link])
      render json: @link
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    link = Link.find(params[:id])
    if link.user_id == current_user.id
      link.destroy
      render json:{}, status:201
    end
  end
end
