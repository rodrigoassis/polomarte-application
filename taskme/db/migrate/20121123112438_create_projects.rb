class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :finished, :default => false

      t.timestamps
    end
  end
end
