class FuncionariosController < ApplicationController
  before_action :set_funcionario, only: [:show, :edit, :update, :destroy]

  # GET /funcionarios
  def index
    @funcionarios = User.where(role: 'funcionario')
  end

  # GET /funcionarios/1
  def show
    @funcionario = User.find(params[:id])
  end

  # GET /funcionarios/new
  def new
    @funcionario = User.new
  end

  # POST /funcionarios
  def create
    @funcionario = User.new(funcionario_params)
    @funcionario.role = 'funcionario'
    if @funcionario.save
      redirect_to funcionario_path(@funcionario), notice: 'Funcionário criado com sucesso.'
    else
      render :new
    end
  end

  # GET /funcionarios/1/edit
  def edit
    # @funcionario já está definido pelo before_action
  end

  # PATCH/PUT /funcionarios/1
  def update
    if @funcionario.update(funcionario_params)
      redirect_to funcionario_path(@funcionario), notice: 'Funcionário atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /funcionarios/1
  def destroy
    @funcionario.destroy
    redirect_to funcionarios_url, notice: 'Funcionário removido com sucesso.'
  end

  private

  def set_funcionario
    @funcionario = User.find(params[:id])
  end

  def funcionario_params
    params.require(:user).permit(:nome, :cpf, :email, :password, :password_confirmation)
  end
end
