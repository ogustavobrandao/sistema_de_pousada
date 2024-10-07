class HospedesController < ApplicationController
  before_action :set_hospede, only: [:show, :edit, :update, :destroy]

  # GET /hospedes
  def index
    @hospedes = User.where(role: 'hospede')
  end

  # GET /hospedes/1
  def show
  end

  # GET /hospedes/new
  def new
    @hospede = User.new
  end

  # POST /hospedes
  def create
    @hospede = User.new(hospede_params)
    @hospede.role = 'hospede'
    if @hospede.save
      redirect_to @hospede, notice: 'Hóspede criado com sucesso.'
    else
      render :new
    end
  end

  # GET /hospedes/1/edit
  def edit
  end

  # PATCH/PUT /hospedes/1
  def update
    if @hospede.update(hospede_params)
      redirect_to @hospede, notice: 'Hóspede atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /hospedes/1
  def destroy
    @hospede.destroy
    redirect_to hospedes_url, notice: 'Hóspede removido com sucesso.'
  end

  # GET /hospedes/search
  def search
    @hospedes = User.where(role: 'hospede').where("nome LIKE ?", "%#{params[:search]}%")
    render :index
  end

  private

    def set_hospede
      @hospede = User.find(params[:id])
    end

    def hospede_params
      params.require(:user).permit(:nome, :email, :password, :password_confirmation)
    end
end
