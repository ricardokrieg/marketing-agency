class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.string :title

      t.timestamps
    end
  end
end
