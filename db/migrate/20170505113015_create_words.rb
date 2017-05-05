class CreateWords < ActiveRecord::Migration
  def change
    create_table :users_words do |t|
      t.string :word, null: false

      t.timestamps(null: false)
    end
  end
end
