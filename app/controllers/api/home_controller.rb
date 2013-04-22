class Api::HomeController < ApplicationController
  def index
    offset = rand(User.count)
    featured_users = User.all(:offset => offset, :limit => 3)
    featured_users = User.all(:limit => 3) if featured_users.length < 3
    render json: {featured_users: featured_users.as_json(include_hash)}
  end
private
  def include_hash
    {:include => [{:events => {:include => {:venue => {:include => :place}}}}, :images], :methods => [:featured_video, :next_show, :custom_links]}
  end

end
