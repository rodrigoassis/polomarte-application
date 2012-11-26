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

  test 'verify finished' do
  	project = Project.create!(:name => 'Go to work')
  	task = Task.create!(:name => 'Wake up', :project_id => project.id)

		assert_equal task, project.tasks.first
  	assert !project.verify_finished

  	task.finished = true
  	task.save!

		project.reload
  	assert project.verify_finished
  end
end
