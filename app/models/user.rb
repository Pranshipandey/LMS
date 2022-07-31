class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # before_save :copy_data
  # after_save :copy_data


  def set_default_role
    self.role ||= :user
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable
end
