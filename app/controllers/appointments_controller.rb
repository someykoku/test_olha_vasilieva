class AppointmentsController < ApplicationController
  def new
    @appointments = current_user.patient_appointments
    @doctors = User.doctors
  end

  def create
    @appointment = current_user.patient_appointments.create!(appointment_params)
    @appointments = current_user.patient_appointments
    @doctors = User.doctors
    render 'new'
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id)
  end
end
