class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages, id: :uuid do |t|
      t.references :campaign, null: false, foreign_key: true, type: :uuid
      t.references :profile, null: false, foreign_key: true, type: :uuid
      t.references :account, null: true, foreign_key: true, type: :uuid
      t.text :content, null: false
      t.datetime :delivered_at

      t.timestamps
    end
  end
end
