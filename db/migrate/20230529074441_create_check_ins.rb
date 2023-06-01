class CreateCheckIns < ActiveRecord::Migration[7.0]
  def change
    create_table :check_ins do |t|
      t.datetime :check_in_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
