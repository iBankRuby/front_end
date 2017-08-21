class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.integer :user_id,       presence: true
      t.string  :access_token,  presence: true
      t.string  :refresh_token

      t.timestamps
    end
  end
end
