class CreateBusinessCards < ActiveRecord::Migration[5.2]
  def change
    create_table :business_cards do |t|
      t.string :imdb
      t.string :twitter
      t.integer :user_id

      t.timestamps
    end
  end
end
