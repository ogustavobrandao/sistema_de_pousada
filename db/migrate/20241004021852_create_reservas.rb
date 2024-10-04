class CreateReservas < ActiveRecord::Migration[7.1]
  def change
    create_table :reservas do |t|
      t.string :cliente_nome
      t.string :status
      t.date :data_reserva
      t.references :quarto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
