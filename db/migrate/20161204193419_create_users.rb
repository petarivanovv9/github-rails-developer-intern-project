class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :uid
      t.string :access_token
      t.string :provider

      t.timestamps
    end
  end
end
