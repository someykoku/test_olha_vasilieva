class Appointment < ApplicationRecord
  validate :doctor_can_have_ten_patients
  belongs_to :doctor, class_name: 'User', foreign_key: 'doctor_id'
  belongs_to :patient, class_name: 'User', foreign_key: 'user_id'
  enum status: [ :pending, :finished ] 
  
  private

  def doctor_can_have_ten_patients
    if new_record? && doctor.pending_doctor_appointments.count >= 10
      errors.add(:patients_count, "Doctor has no free appointments")
    end
  end
end
