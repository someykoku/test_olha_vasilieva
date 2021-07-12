class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  

  validates :mobile, uniqueness: true
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  belongs_to :category, optional: true
  enum role: [ :user, :doctor, :admin ] 

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    where(mobile: conditions[:mobile]).first
  end
  
  def email_required?
    false
  end
  
  def email_changed?
    false
  end
  
  def will_save_change_to_email?
    false
  end
end
