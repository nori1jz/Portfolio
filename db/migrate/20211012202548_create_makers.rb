class CreateMakers < ActiveRecord::Migration[5.2]
  def change
    create_table :makers do |t|
      t.string :name, null:false
      t.string :email, null:false
      t.string :telephone_number, null:false
      t.string :fax_number, null:false
      t.boolean :is_active, null:false, default:true

      t.timestamps
    end
  end
end
