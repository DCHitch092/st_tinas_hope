require_relative('../models/vet')
require('pry')

Vet.delete_all()

vet1 = Vet.new(
  { 'name' => 'Nurse Elmo',
    'role' => 'Nurse',
    'fav_colour' => 'rainbow',
    'profile_image' => 'nurse_elmo.png'})

vet2 = Vet.new(
  { 'name' => 'Nurse ChumChi',
    'role' => 'Nurse',
    'fav_colour' => 'orange',
    'profile_image' => 'nurse_chumchi.png'})

vet1.save()
vet2.save()

binding.pry

nil
