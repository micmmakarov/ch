class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :bio, :image_url, :name, :facebook, :twitter, :location, :website
  has_many :authentications
  has_many :users_events
  has_and_belongs_to_many :events, :join_table => :users_events
  before_save :generate_slug
  has_many :images

  def generate_slug
    if self.slug.blank?
      s = "#{name}"
      self.slug = to_slug(s)
    end
  end


  def to_slug(str)
    str.gsub! /['`]/,""

    # @ --> at, and & --> and
    str.gsub! /\s*@\s*/, " at "
    str.gsub! /\s*&\s*/, " and "

    #replace all non alphanumeric, underscore or periods with underscore
    str.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '_'

    #convert double underscores to single
    str.gsub! /_+/,"_"

    #strip off leading/trailing underscore
    str.gsub! /\A[_\.]+|[_\.]+\z/,""

    str
  end

end
