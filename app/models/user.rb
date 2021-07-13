class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  

  validates :mobile, uniqueness: true
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  belongs_to :category, optional: true
  has_many :doctor_appointments, class_name: 'Appointment', foreign_key: 'doctor_id'
  has_many :patient_appointments, class_name: 'Appointment', foreign_key: 'user_id'

  has_many :patients, through: :doctor_appointments, class_name: 'User'
  has_many :doctors, through: :patient_appointments, class_name: 'User'


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
