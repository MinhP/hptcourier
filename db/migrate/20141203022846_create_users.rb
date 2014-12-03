class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :name
      t.string :email
      t.string :instructions
      t.boolean :is_admin
    end
  end
end
