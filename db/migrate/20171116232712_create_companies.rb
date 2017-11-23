class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :code
      t.string :name
      t.integer :address_id 
      t.string :tel_no
      t.timestamps
    end
  end
end
