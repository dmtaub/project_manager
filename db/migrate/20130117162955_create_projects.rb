class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :priority
      t.string :project
      t.date :completion
      t.string :status
      t.text :notes
      t.references :user_id, index: true

      t.timestamps
    end
  end
end
