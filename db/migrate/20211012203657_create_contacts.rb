class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :customer_id, null:false
      t.string :company, null:false
      t.string :name, null:false
      t.string :email, null:false
      t.string :subject, default: "", null: false
      t.text :message, null:false

      t.timestamps
    end
  end
end
