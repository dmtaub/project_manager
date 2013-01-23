class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :priority
      t.string :project
      t.date :target_completion
      t.string :status
      t.text :notes
      t.references :user, index: true

      t.timestamps
    end
  end
end
