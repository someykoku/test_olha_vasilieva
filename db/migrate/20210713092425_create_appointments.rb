class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :doctor, index: true, foreign_key: { to_table: :users }
      t.references :user, index: true, foreign_key: { to_table: :users }
      t.integer :status, null: false, default: 0
      t.text :recomendation
      t.timestamps
    end
  end
end
