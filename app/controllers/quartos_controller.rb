class QuartosController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_quarto, only: %i[ show edit update destroy ]

  # GET /quartos or /quartos.json
  def index
    @quartos = Quarto.all
  end

  # GET /quartos/1 or /quartos/1.json
  def show
  end

  # GET /quartos/new
  def new
    @quarto = Quarto.new
  end

  # GET /quartos/1/edit
  def edit
  end

  # POST /quartos or /quartos.json
  def create
    @quarto = Quarto.new(quarto_params)

    respond_to do |format|
      if @quarto.save
        format.html { redirect_to @quarto, notice: "Quarto criado com sucesso." }
        format.json { render :show, status: :created, location: @quarto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quarto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quartos/1 or /quartos/1.json
  def update
    respond_to do |format|
      if @quarto.update(quarto_params)
        format.html { redirect_to @quarto, notice: "Quarto atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @quarto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quarto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quartos/1 or /quartos/1.json
  def destroy
    @quarto.destroy!

    respond_to do |format|
      format.html { redirect_to quartos_path, status: :see_other, notice: "Quarto removido com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    def set_quarto
      @quarto = Quarto.find(params[:id])
    end

    def quarto_params
      params.require(:quarto).permit(:numero, :andar, :preco)
    end
end
