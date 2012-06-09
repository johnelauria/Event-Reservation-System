class CreateOrganizerSessions < ActiveRecord::Migration
  def change
    create_table :organizer_sessions do |t|

      t.timestamps
    end
  end
end
