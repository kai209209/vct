class CreateApplies < ActiveRecord::Migration[5.0]
  def change
    create_table :applies do |t|
      t.integer :author_id
      t.integer :receiver_id
      t.string :detail
      t.integer :apply_status

      t.timestamps
    end
  end
end
