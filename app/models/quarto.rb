class Quarto < ApplicationRecord
    
    def descricao
        "Quarto #{numero} - Andar: #{andar}"
    end
end
