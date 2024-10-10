class Reserva < ApplicationRecord
  belongs_to :quarto
  belongs_to :user

  validates :status, presence: true
  validates :data_reserva, presence: true
  validates :quarto, presence: true
  validates :user, presence: true
end
