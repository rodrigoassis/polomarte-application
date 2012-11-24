require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "default finished false" do
  	task = Task.create!(:name => 'test')

  	assert !task.finished
  end

  test "name cannot be blank" do
  	task = Task.new

  	assert !task.save
  end
end
