class CreateWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :cpf
      t.date :birthdate
      t.string :street
      t.string :number
      t.string :district
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :personal_phone
      t.string :reference_phone
      t.decimal :salary

      t.timestamps
    end
  end
end
