require('minitest/autorun')
require('minitest/rg')
require_relative('../vet')

class VetTest < MiniTest::Test

  def test_find()
    @test_return = Vet.find(1)
    assert_equal(@test_return.name, 'Nurse Elmo')
  end

end
