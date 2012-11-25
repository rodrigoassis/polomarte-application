class Project < ActiveRecord::Base
	has_many :tasks

	validates_presence_of :name
	validates_uniqueness_of :name

	accepts_nested_attributes_for :tasks, :allow_destroy => true

	def verify_finished
		not self.tasks.any? {|task| task.finished == false}
	end

	def verify_finished_and_save
		self.finished = self.verify_finished
		self.save
	end
end
