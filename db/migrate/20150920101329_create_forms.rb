class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :long_url
      t.string :short_url
      t.integer :click ,:default => 0
      t.timestamps null: false
    end
  end
end
