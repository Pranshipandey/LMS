class Dropbooks < ActiveRecord::Migration[7.0]
  def change
    drop_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.string :subject
    end
  end
end
