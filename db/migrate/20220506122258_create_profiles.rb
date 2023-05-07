class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles, id: :uuid do |t|
      t.bigint :instagram_id
      t.string :username

      t.timestamps
    end

    add_index :profiles, :instagram_id, unique: true
    add_index :profiles, :username, unique: true
  end
end
