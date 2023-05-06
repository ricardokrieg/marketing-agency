class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles, id: :uuid do |t|
      t.integer :instagram_id
      t.string :username

      t.timestamps
    end
  end
end
