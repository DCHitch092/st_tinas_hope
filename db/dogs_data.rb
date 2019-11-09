require_relative('../models/vet')
require_relative('../models/animal')
require_relative('../models/human')
require('pry')

Vet.delete_all()
Animal.delete_all()
Human.delete_all()

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
    'date_of_birth' => '2013-05-15',
    'type' =>  'dog',
    'fav_colour' => 'purple',
    'age' => 6})

animal2 = Animal.new(
  { 'name' => 'PaPaPiPi-Pu',
    'date_of_birth' => '2013-05-15',
    'type' =>  'dog',
    'fav_colour' => 'blue',
    'age' => 6})

animal1.save()
animal2.save()

human1 = Human.new({
  'name' => 'Hitch',
  'email' => 'hitch@hitch.com',
  'address' => '123 Hitch Town',
  'phone' => '+4477222222',
  'fav_colour' => 'Red'})

human2 = Human.new({
  'name' => 'Maz',
  'email' => 'maz@hitch.com',
  'address' => '124 Maz Village',
  'phone' => '+44772122222',
  'fav_colour' => 'Aqua Marine'})

human1.save()
human2.save()

# binding.pry
#
# nil
