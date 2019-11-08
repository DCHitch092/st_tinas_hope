require('minitest/autorun')
require('minitest/rg')
require_relative('../vet')

class VetTest < MiniTest::Test

  def test_find_name()
    @test_return = Vet.find(1)
    assert_equal(@test_return['name'], 'Nurse Elmo')
  end

  def test_find_role()
    @test_return = Vet.find(1)
    assert_equal(@test_return['role'], 'Nurse')
  end

  def test_find_fav_colour()
    @test_return = Vet.find(1)
    assert_equal(@test_return['fav_colour'], 'rainbow')
  end

  def test_find_profile_image()
    @test_return = Vet.find(1)
    assert_equal(@test_return['profile_image'], 'nurse_elmo.png')
  end



end
