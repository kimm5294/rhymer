class CreateUsersWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.references :user, null: false
      t.references :word, null: false

      t.timestamps(null: false)
    end
  end
end
