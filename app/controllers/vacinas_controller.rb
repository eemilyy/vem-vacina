class VacinasController < ApplicationController
  before_action :set_vacina, only: %i[ show edit update destroy ]

  # GET /vacinas or /vacinas.json
  def index
    @vacinas = Vacina.all
  end

  # GET /vacinas/1 or /vacinas/1.json
  def show
  end

  # GET /vacinas/new
  def new
    @vacina = Vacina.new
  end

  # GET /vacinas/1/edit
  def edit
  end

  # POST /vacinas or /vacinas.json
  def create
    @vacina = Vacina.new(vacina_params)

    respond_to do |format|
      if @vacina.save
        format.html { redirect_to @vacina, notice: "Vacina was successfully created." }
        format.json { render :show, status: :created, location: @vacina }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vacina.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacinas/1 or /vacinas/1.json
  def update
    respond_to do |format|
      if @vacina.update(vacina_params)
        format.html { redirect_to @vacina, notice: "Vacina was successfully updated." }
        format.json { render :show, status: :ok, location: @vacina }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vacina.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacinas/1 or /vacinas/1.json
  def destroy
    @vacina.destroy
    respond_to do |format|
      format.html { redirect_to vacinas_url, notice: "Vacina was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacina
      @vacina = Vacina.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vacina_params
      params.require(:vacina).permit(:nome_vacina, :localizacao, :data, :horario)
    end
end
