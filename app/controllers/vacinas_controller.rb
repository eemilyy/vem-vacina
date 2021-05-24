class VacinasController < ApplicationController
  before_action :require_logged_in
  before_action :set_vacina, only: %i[ show edit update destroy ]

  # GET /vacinas or /vacinas.json
  def index
    @vacinas = current_usuario.vacinas
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
    @vacina = current_usuario.vacinas.build(vacina_params)

    respond_to do |format|
      if @vacina.save
        format.html { redirect_to @vacina, notice: "Agendamento criado com sucesso" }
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
        format.html { redirect_to @vacina, notice: "Agendamento editado com sucesso" }
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
      format.html { redirect_to vacinas_url, notice: "Agendamento apagado com sucesso" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacina
      @vacina = current_usuario.vacinas.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vacina_params
      params.require(:vacina).permit(:nome_vacina, :localizacao, :data, :horario)
    end
end
