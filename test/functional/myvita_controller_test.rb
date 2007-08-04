require File.dirname(__FILE__) + '/../test_helper'
require 'myvita_controller'

# Re-raise errors caught by the controller.
class MyvitaController; def rescue_action(e) raise e end; end

class MyvitaControllerTest < Test::Unit::TestCase
  def setup
    @controller = MyvitaController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
