# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
category1 = Category.create(name: 'therapist')
category2 = Category.create(name: 'surgeon')


admin = User.create(full_name: 'Mr. Admin', role: 'admin', mobile: '+380679438757', password: 'password', password_confirmation: 'password')
doctor1 = User.create(full_name: 'Mr. Doctor1', role: 'doctor', mobile: '+380679438434', password: 'password', password_confirmation: 'password', category: category1)
doctor2 = User.create(full_name: 'Mr. Doctor2', role: 'doctor', mobile: '+380679438534', password: 'password', password_confirmation: 'password', category: category2)
patient = User.create(full_name: 'Mr. Patient', role: 'user', mobile: '+380679478434', password: 'password', password_confirmation: 'password')


Appointment.create(doctor: doctor1, patient: patient)
Appointment.create(doctor: doctor2, patient: patient)