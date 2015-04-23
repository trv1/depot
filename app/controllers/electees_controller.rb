class ElecteesController < ApplicationController
  before_action :set_electee, only: [:show, :edit, :update, :destroy]

  # GET /electees
  # GET /electees.json
  def index
    @electees = Electee.all
  end

  # GET /electees/1
  # GET /electees/1.json
  def show
  end

  # GET /electees/new
  def new
    @electee = Electee.new
  end

  # GET /electees/1/edit
  def edit
  end

  # POST /electees
  # POST /electees.json
  def create
    @electee = Electee.new(electee_params)

    respond_to do |format|
      if @electee.save
        format.html { redirect_to @electee, notice: 'Electee was successfully created.' }
        format.json { render :show, status: :created, location: @electee }
      else
        format.html { render :new }
        format.json { render json: @electee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /electees/1
  # PATCH/PUT /electees/1.json
  def update
    respond_to do |format|
      if @electee.update(electee_params)
        format.html { redirect_to @electee, notice: 'Electee was successfully updated.' }
        format.json { render :show, status: :ok, location: @electee }
      else
        format.html { render :edit }
        format.json { render json: @electee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /electees/1
  # DELETE /electees/1.json
  def destroy
    @electee.destroy
    respond_to do |format|
      format.html { redirect_to electees_url, notice: 'Electee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_electee
      @electee = Electee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def electee_params
      params.require(:electee).permit(:user_id)
    end
end
