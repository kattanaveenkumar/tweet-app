class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :organization
  has_many :permissions
  has_many :tweets

  after_create :set_permissions

  def set_permissions
  	self.permissions.create!(user_id: self.id, role_id: Role.where(name: "non_admin").first.id)
  end

  def role?(role_name)
  	self.permissions.map{|p| p.role_id}.include? Role.where(name: role_name).first.id
    
  end

  def tweet_owner?(user_id, tweet_id)
  	Tweet.find_by_user_id_and_tweet_id(user_id, tweet_id)
  end

  def my_org_users
  	User.where(organization_id: self.organization_id)
  end
end
