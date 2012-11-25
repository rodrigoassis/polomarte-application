class TasksController < ApplicationController

	def finish
		@task = Task.find(params[:id])

    new = {:finished => (not @task.finished)}
    @task.update_attributes(new)

    @task.project.verify_finished_and_save
	end

end
