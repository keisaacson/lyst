class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.references :list, index: true
      t.references :user, index: true
      t.string :share_access
      t.string :favorite

      t.timestamps
    end
  end
end
