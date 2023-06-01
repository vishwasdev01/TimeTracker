class CreateBreaks < ActiveRecord::Migration[7.0]
  def change
    create_table :breaks do |t|
      t.datetime :break_check_in_time
      t.datetime :break_check_out_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
