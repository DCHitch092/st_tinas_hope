require_relative('../models/vet')
require_relative('../models/animal')
require('pry')

Vet.delete_all()
Animal.delete_all()

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

animal1 = Animal.new(
  { 'name' => 'PiPiPaPa-Pu',
    'date_of_birth' => '2013/05/15',
    'type' =>  'dog',
    'fav_colour' => 'purple',
    'age' => 6})

animal2 = Animal.new(
  { 'name' => 'PaPaPiPi-Pu',
    'date_of_birth' => '2013/05/15',
    'type' =>  'dog',
    'fav_colour' => 'blue',
    'age' => 6})

animal1.save()
animal2.save()

binding.pry

nil
