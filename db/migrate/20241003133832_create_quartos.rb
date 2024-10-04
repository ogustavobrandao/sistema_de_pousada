class CreateQuartos < ActiveRecord::Migration[7.1]
  def change
    create_table :quartos do |t|
      t.integer :numero
      t.string :andar
      t.float :preco

      t.timestamps
    end
  end
end
