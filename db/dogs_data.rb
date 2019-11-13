require_relative('../models/vet')
require_relative('../models/animal')
require_relative('../models/human')
require_relative('../models/note')

require('pry')

Note.delete_all()
Animal.delete_all()
Vet.delete_all()
Human.delete_all()


vet1 = Vet.new(
  { 'vet_name' => 'Nurse Elmo',
    'role' => 'Nurse',
    'fav_colour' => 'rainbow',
    'profile_image' => 'nurse-elmo.jpg',
    'deleted' => FALSE})

vet2 = Vet.new(
  { 'vet_name' => 'Nurse ChumChi',
    'role' => 'Nurse',
    'fav_colour' => 'orange',
    'profile_image' => 'nurse-chumchi.jpg',
    'deleted' => FALSE})
vet3 = Vet.new(
  { 'vet_name' => 'ChiChiPu',
    'role' => 'Trainee',
    'fav_colour' => 'orange',
    'profile_image' => 'chichipu.jpg',
    'deleted' => FALSE})

vet4 = Vet.new(
  { 'vet_name' => 'PiPiChu',
    'role' => 'Trainee',
    'fav_colour' => 'orange',
    'profile_image' => 'pipichu.jpg',
    'deleted' => FALSE})

vet5 = Vet.new(
  { 'vet_name' => 'Nurse Betulla',
    'role' => 'Nurse',
    'fav_colour' => 'orange',
    'profile_image' => 'nurse-betulla.jpg',
    'deleted' => FALSE})

unassigned = Vet.new(
  { 'vet_name' => 'Unassigned',
    'role' => 'n/a',
    'fav_colour' => 'n/a',
    'profile_image' => 'unassigned.jpg',
    'deleted' => FALSE})

deleted_test = Vet.new(
  { 'vet_name' => 'Timmy',
    'role' => 'Nurse',
    'fav_colour' => 'black',
    'profile_image' => 'timmy.jpg',
    'deleted' => TRUE})

deleted_test2 = Vet.new(
  { 'vet_name' => 'Butterman',
    'role' => 'Nurse',
    'fav_colour' => 'Not Rainbow',
    'profile_image' => 'butterman.jpg',
    'deleted' => TRUE})

vet1.save()
vet2.save()
vet3.save()
vet4.save()
vet5.save()
unassigned.save()
deleted_test.save()
deleted_test2.save()

human1 = Human.new({
  'human_name' => 'Hitch',
  'email' => 'hitch@hitch.com',
  'address' => '123 Hitch Town',
  'phone' => '+4477222222',
  'fav_colour' => 'Red'})

human2 = Human.new({
  'human_name' => 'Maz',
  'email' => 'maz@hitch.com',
  'address' => '124 Maz Village',
  'phone' => '+44772122222',
  'fav_colour' => '#17bab6'})

stray = Human.new({
  'human_name' => 'Stray',
  'email' => 'no owner',
  'address' => 'no owner',
  'phone' => 'no owner',
  'fav_colour' => ''})

human1.save()
human2.save()
stray.save()

animal1 = Animal.new(
  { 'animal_name' => 'PiPiPaPa-Pu',
    'date_of_birth' => '2012-05-15',
    'type' =>  'dog',
    'fav_colour' => '#f5f5dc',
    # beige
    'age' => 7,
    'human_id' => human1.id,
    'vet_id' => vet1.id})

fish1 = Animal.new(
  { 'animal_name' => 'Kleinefinger',
    'date_of_birth' => '',
    'type' =>  'fish',
    'fav_colour' => 'unknown',
    'age' => 3,
    'human_id' => human1.id,
    'vet_id' => vet1.id})

bird1 = Animal.new(
  { 'animal_name' => 'Squilbo',
    'date_of_birth' => '',
    'type' =>  'bird',
    'fav_colour' => 'unknown',
    'age' => 3,
    'human_id' => human1.id,
    'vet_id' => vet1.id})

animal2 = Animal.new(
  { 'animal_name' => 'PaPaPiPi-Pu',
    'date_of_birth' => '2012-05-15',
    'type' =>  'dog',
    'fav_colour' => '#fffdd0',
    # cream
    'age' => 7,
    'human_id' => human1.id,
    'vet_id' => vet2.id})

animal3 = Animal.new(
  { 'animal_name' => 'PeeChiPu',
    'date_of_birth' => '2014-05-15',
    'type' =>  'dog',
    'fav_colour' => 'undisclosed',
    'age' => 5,
    'human_id' => human2.id,
    'vet_id' => vet2.id})

animal4 = Animal.new(
  { 'animal_name' => 'Te-Tina',
    'date_of_birth' => '2015-11-15',
    'type' =>  'dog',
    'fav_colour' => '#89cff0',
    # baby blue
    'age' => 4,
    'human_id' => human2.id,
    'vet_id' => unassigned.id})

animal5 = Animal.new(
  { 'animal_name' => 'Te-Tina',
    'date_of_birth' => '2015-11-15',
    'type' =>  'dog',
    'fav_colour' => '#00bfff',
    # sky blue
    'age' => 4,
    'human_id' => human2.id,
    'vet_id' => unassigned.id})

animal6 = Animal.new(
  { 'animal_name' => 'Te-Tim',
    'date_of_birth' => '2015-11-15',
    'type' =>  'dog',
    'fav_colour' => '#808000',
    # navy blue
    'age' => 4,
    'human_id' => human2.id,
    'vet_id' => unassigned.id})

animal7 = Animal.new(
  { 'animal_name' => 'Te-Tina Fe-Fey',
    'date_of_birth' => '2015-11-15',
    'type' =>  'dog',
    'fav_colour' => '#4169e1',
    # royal blue
    'age' => 4,
    'human_id' => human2.id,
    'vet_id' => unassigned.id})

animal8 = Animal.new(
  { 'animal_name' => 'BoBo',
    'date_of_birth' => '2017-06-03',
    'type' =>  'dog',
    'fav_colour' => 'red and white stripey',
    # red and white stripe
    'age' => '2',
    'human_id' => human2.id,
    'vet_id' => unassigned.id})

animal9 = Animal.new(
  { 'animal_name' => 'ViVi-VaVaVu',
    'date_of_birth' => '2018-08-10',
    'type' =>  'dog',
    'fav_colour' => 'unknown',
    'age' => 2,
    'human_id' => human2.id,
    'vet_id' => unassigned.id})

animal11 = Animal.new(
  { 'animal_name' => 'VaVa-ViViVu',
    'date_of_birth' => '2018-08-10',
    'type' =>  'dog',
    'fav_colour' => 'unknown',
    'age' => 2,
    'human_id' => human2.id,
    'vet_id' => unassigned.id})



animal1.new_animal()
animal2.new_animal()
animal3.new_animal()
animal4.new_animal()
animal5.new_animal()
animal6.new_animal()
animal7.new_animal()
animal8.new_animal()
animal9.new_animal()
animal11.new_animal()
fish1.new_animal()
bird1.new_animal()

# timestring1 = 'Wed, 26 May 2017 14:00:00 +0800'
# Time.parse(string).strftime('%F %T %z')
# #=> "2017-05-26 14:00:00 +0800"

note3 = Note.new(
  {
    'animal_id' => animal1.id,
    'vet_id' => vet1.id,
    'body' => "looks unwell, maybe needs strawberries",
    'timestamp' => "2019-09-20 09:00:00 +0000"
  }
)

note2 = Note.new(
  {
    'animal_id' => animal2.id,
    'vet_id' => vet2.id,
    'body' => "poor chump needs a tickle",
    'timestamp' => "2018-12-26 14:00:00 +0000"
  }
)
note1 = Note.new(
  {
    'animal_id' => animal1.id,
    'vet_id' => vet2.id,
    'body' => "looks much better, thanks to the strawberries",
    'timestamp' => "2019-10-26 17:23:00 +0000"
  }
)

note1.save
note2.save
note3.save
