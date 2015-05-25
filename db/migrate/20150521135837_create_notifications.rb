class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user, index: true
      t.string :job_title
      t.string :department

      t.timestamps
    end
  end
end
