class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :topics, dependent: :destroy
  has_many :comments, dependent: :destroy
  after_create :set_default_role
  
  def admin?
  	has_role?(:admin)
  end

  def moderator?
  	has_role?(:moderator)
  end

  def simple_user?
  	has_role?(:simple_user)
  end
  private
    def set_default_role
    add_role(:simple_user)
  end
end
