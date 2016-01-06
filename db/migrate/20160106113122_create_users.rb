class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :auth_token
      t.boolean :admin
      t.references :organization, index: true

      t.timestamps
    end
  end
end
