class CreateLeads < ActiveRecord::Migration[7.1]
  def change
    create_table :leads do |t|
      t.string :advisory_need
      t.string :project_timing
      t.integer :financing_need
      t.integer :financial_investment
      t.references :simulation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
