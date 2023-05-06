class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns, id: :uuid do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.text :targets, null: false

      t.timestamps
    end
  end
end
