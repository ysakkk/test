class CreateRedmineClViewSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :redmine_cl_view_settings do |t|
      t.string :project_name
      t.string :access_key
      t.string :secret_key
      t.string :aws_region

      t.timestamps
    end
  end
end
