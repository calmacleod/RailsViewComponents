class AddAuthenticationFields < ActiveRecord::Migration[8.0]
  def change
    rename_column :users, :email, :email_address

    add_column :users, :password_digest, :string, null: false, default: ""

    add_index :users, :email_address, unique: true

    create_table :sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :ip_address
      t.string :user_agent

      t.timestamps
    end
  end
end
