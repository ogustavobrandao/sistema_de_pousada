class ContasController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_conta, only: [:show, :edit, :update, :destroy]

  # GET /contas
  def index
    @contas = User.all
  end

  # GET /contas/1
  def show
    # @conta já está definido pelo before_action
  end

  # GET /contas/new
  def new
    @conta = User.new
  end

  # POST /contas
  def create
    @conta = User.new(conta_params)
    if @conta.save
      redirect_to conta_path(@conta), notice: 'Usuário criado com sucesso.'
    else
      render :new
    end
  end

  # GET /contas/1/edit
  def edit
    # @conta já está definido pelo before_action
  end

  # PATCH/PUT /contas/1
  def update
    if @conta.update(conta_params)
      redirect_to conta_path(@conta), notice: 'Usuário atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /contas/1
  def destroy
    @conta.destroy
    redirect_to contas_url, notice: 'Usuário removido com sucesso.'
  end

  private

  def set_conta
    @conta = User.find(params[:id])
  end

  def conta_params
    params.require(:user).permit(:nome, :cpf, :role, :is_active, :email, :password, :password_confirmation)
  end
end
