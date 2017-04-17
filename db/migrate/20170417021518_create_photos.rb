class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.column :user_id, :integer
      t.column :date_time, :date
      t.column :file_name, :string
      t.timestamps null: false
    end
  end
end
