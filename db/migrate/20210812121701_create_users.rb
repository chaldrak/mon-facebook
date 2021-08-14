class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string        :name
      t.string        :surname
      t.text          :email
      t.text          :password_digest
      t.string        :sexe
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
