class Quarto < ApplicationRecord
    validates :numero, presence: true, uniqueness: true
    validates :andar, presence: true
    validates :preco, presence: true, numericality: { greater_than: 0 }
    
    def descricao
        "Quarto #{numero} - Andar: #{andar}"
    end
end
