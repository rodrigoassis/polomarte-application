require 'test_helper'

class TaskTest < ActionDispatch::IntegrationTest
  fixtures :all

  test 'add a task' do
		visit(new_project_path)

		assert page.has_content?('Add a task')
	end

	test 'click add a task' do
		visit(new_project_path)

		assert !page.has_content?('Remove this task')
		click_link('Add a task')
		assert page.has_content?('Remove this task')
	end

	test 'remove a task' do
		visit(new_project_path)

		click_link('Add a task')
		click_link('Remove this task')
		assert !page.has_content?('Remove this task')
	end

	test 'task name cant be blank' do
		visit(new_project_path)

		fill_in('project_name', :with => 'Test')
		click_link('Add a task')

		click_button('Create Project')
		assert page.has_content?("can't be blank")
	end

	test 'finish task' do
		task = tasks(:wakeup)

		visit(project_path(task.project))

		assert !task.finished
		check(task.name)
		assert page.has_content?("finished")
	end

end
