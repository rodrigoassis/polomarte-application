require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "default finished false" do
  	project = Project.create!(:name => 'test')

  	assert !project.finished
  end

  test "name cannot be blank" do
  	project = Project.new

  	assert !project.save
  end

  test 'name uniqueness' do
  	project = Project.new(:name => 'Whatever')
  	assert project.save

  	project = Project.new(:name => 'Whatever')
  	assert !project.save
  end
end