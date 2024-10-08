class HospedesController < ApplicationController
  before_action :set_hospede, only: [:show, :edit, :update, :destroy]

  # GET /hospedes
  def index
    @hospedes = User.where(role: 'hospede')
  end

  # GET /hospedes/1
  def show
    @hospede = User.find(params[:id])
  end

  # GET /hospedes/new
  def new
    @hospede = User.new
  end

  # POST /hospedes
  def create
    @hospede = User.new(hospede_params)
    @hospede.role = 'hospede' # Define o papel como 'hospede'
    if @hospede.save
      redirect_to hospede_path(@hospede), notice: 'Hóspede criado com sucesso.'
    else
      render :new
    end
  end

  # GET /hospedes/1/edit
  def edit
    # @hospede já está definido pelo before_action
  end

  # PATCH/PUT /hospedes/1
  def update
    if @hospede.update(hospede_params)
      redirect_to hospede_path(@hospede), notice: 'Hóspede atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /hospedes/1
  def destroy
    @hospede.destroy
    redirect_to hospedes_url, notice: 'Hóspede removido com sucesso.'
  end

  private

  def set_hospede
    @hospede = User.find(params[:id]) # Certifique-se de que isso retorna o usuário correto
  end

  def hospede_params
    params.require(:user).permit(:nome, :cpf, :email, :password, :password_confirmation)
  end
end
