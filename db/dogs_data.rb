require_relative('../models/vet')
require_relative('../models/animal')
require_relative('../models/human')
require_relative('../models/note')
# require_relative('../models/vet_assign')
# require_relative('../models/human_assign')

require('pry')

# VetAssign.delete_all()
# HumanAssign.delete_all()
Note.delete_all()
Animal.delete_all()
Vet.delete_all()
Human.delete_all()


vet1 = Vet.new(
  { 'name' => 'Nurse Elmo',
    'role' => 'Nurse',
    'fav_colour' => 'rainbow',
    'profile_image' => 'nurse-elmo.png'})

vet2 = Vet.new(
  { 'name' => 'Nurse ChumChi',
    'role' => 'Nurse',
    'fav_colour' => 'orange',
    'profile_image' => 'nurse-chumchi.png'})

unassigned = Vet.new(
  { 'name' => 'Unassigned',
    'role' => 'n/a',
    'fav_colour' => 'n/a',
    'profile_image' => 'unassigned.png'})

vet1.save()
vet2.save()
unassigned.save()

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

stray = Human.new({
  'name' => 'Stray',
  'email' => 'no owner',
  'address' => 'no owner',
  'phone' => 'no owner',
  'fav_colour' => ''})

human1.save()
human2.save()
stray.save()

animal1 = Animal.new(
  { 'name' => 'PiPiPaPa-Pu',
    'date_of_birth' => '2013-05-15',
    'type' =>  'dog',
    'fav_colour' => 'purple',
    'age' => 6,
    'human_id' => human1.id,
    'vet_id' => vet1.id})

animal2 = Animal.new(
  { 'name' => 'PaPaPiPi-Pu',
    'date_of_birth' => '2013-05-15',
    'type' =>  'dog',
    'fav_colour' => 'blue',
    'age' => 6,
    'human_id' => human1.id,
    'vet_id' => vet2.id})

animal3 = Animal.new(
  { 'name' => 'PeeChiPu',
    'date_of_birth' => '',
    'type' =>  'dog',
    'fav_colour' => 'blue',
    'age' => 2,
    'human_id' => human2.id,
    'vet_id' => vet2.id})

animal4 = Animal.new(
  { 'name' => 'PeeChiPu',
    'date_of_birth' => '',
    'type' =>  'dog',
    'fav_colour' => 'blue',
    'age' => 2,
    'human_id' => human2.id,
    'vet_id' => unassigned.id})

animal1.new_animal()
animal2.new_animal()
animal3.new_animal()
animal4.new_animal()

note3 = Note.new(
  {
    'animal_id' => animal1.id,
    'vet_id' => vet1.id,
    'body' => "looks much better, thanks to the strawberries",
    'timestamp' => Time.now,
  }
)

note2 = Note.new(
  {
    'animal_id' => animal2.id,
    'vet_id' => vet2.id,
    'body' => "poor chump needs a tickle",
    'timestamp' => Time.now-2000,
  }
)
note1 = Note.new(
  {
    'animal_id' => animal1.id,
    'vet_id' => vet2.id,
    'body' => "looks unwell, maybe needs strawberries",
    'timestamp' => Time.now-20000,
  }
)

note1.save
note2.save
note3.save

# vet_assign1 = VetAssign.new({
#   'animal_id' => animal1.id,
#   'vet_id' => vet1.id
#   })
# vet_assign2 = VetAssign.new({
#   'animal_id' => animal2.id,
#   'vet_id' => vet2.id
#   })
# vet_assign3 = VetAssign.new({
#   'animal_id' => animal1.id,
#   'vet_id' => vet2.id
#   })
#
#   vet_assign1.save()
#   vet_assign2.save()
#   vet_assign3.save()

# human_assign1 = HumanAssign.new({
#   'animal_id' => animal1.id,
#   'human_id' => human1.id
#   })
# human_assign2 = HumanAssign.new({
#   'animal_id' => animal2.id,
#   'human_id' => human2.id
#   })
# human_assign3 = HumanAssign.new({
#   'animal_id' => animal1.id,
#   'human_id' => human2.id
#   })
#
#   human_assign1.save()
#   human_assign2.save()
#   human_assign3.save()
#
# binding.pry
#
# nil
