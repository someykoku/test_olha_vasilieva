class AppointmentsController < ApplicationController
  def new
    @appointments = current_user.appointments
    @doctors = User.doctors
  end

  def create
    @appointment = current_user.appointments.create!(appointment_params)
    @appointments = current_user.appointments
    @doctors = User.doctors
    render 'new'
  end

  def finish
    @appointment = current_user.appointments.find_by_id(params[:id])
    @appointment.status = 'finished'
    @appointment.update(finish_appointment_params)
    if @appointment.errors.empty?
      redirect_to appointments_path
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id)
  end

  def finish_appointment_params
    params.require(:appointment).permit(:recomendation)
  end
end
