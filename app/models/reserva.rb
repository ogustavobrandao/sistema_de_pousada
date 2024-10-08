class Reserva < ApplicationRecord
  belongs_to :quarto
  belongs_to :user
end
