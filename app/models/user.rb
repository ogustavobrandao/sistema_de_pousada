class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nome, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }, numericality: { only_integer: true }
  validates :role, presence: true, inclusion: { in: %w[administrador funcionario hospede] }
  validates :is_active, inclusion: { in: [true, false] }
  validates :password, presence: true, on: :create 

  def admin?
    role == 'administrador'
  end

  def funcionario?
    role == 'funcionario'
  end
end
