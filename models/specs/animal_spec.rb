require('minitest/autorun')
require('minitest/rg')
require_relative('../animal')

class VetTest < MiniTest::Test

  def setup
    @animal_no_age = Animal.new(
      { 'name' => 'test_boy',
        'date_of_birth' => '2018-11-01',
        'type' =>  'dog',
        'fav_colour' => 'purple',
        'age' => ''})


  end

  def test_get_dob()
    animal_no_dob = Animal.new(
      { 'name' => 'test_girl',
        'date_of_birth' => '',
        'type' =>  'dog',
        'fav_colour' => 'purple',
        'age' => 1})

    result = animal_no_dob.get_dob()
    assert_equal('2018-11-09', result)
  end

  # def test_get_age()
  #   result = animal_no_age.get_age()
  #   assert_equal('2018-11-09', result)
  # end
  #
  # def test_save__no_age()
  # end
  #
  # def test_save__no_dob()
  # end
  #
  # def test_save__no_age_or_dob()
  # end


end
