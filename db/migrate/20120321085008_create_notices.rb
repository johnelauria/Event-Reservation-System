class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :note

      t.timestamps
    end
  end
end
