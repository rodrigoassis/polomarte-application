require 'test_helper'

class ProjectTest < ActionDispatch::IntegrationTest
  fixtures :all

	test 'root' do
		visit('/')
		assert_equal root_path, current_path
	end

	test 'new vai pro form' do
		visit('/')
		click_link('New')

		assert_equal new_project_path, current_path
	end

	test 'form possui campo name' do
		visit(new_project_path)

		assert find_field('project_name')
		assert !page.has_field?('Finished')
	end

	test 'name cant be blank' do
		visit(new_project_path)

		click_button('Create Project')
		assert page.has_content?("can't be blank")
	end

	test 'create project' do
		visit(new_project_path)

		fill_in('project_name', :with => 'Test')
		click_button('Create Project')

		assert page.has_content?('Project was successfully created.')
	end

end
