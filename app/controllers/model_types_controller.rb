class ModelTypesController < ApplicationController
  before_filter :authenticate
  before_action :set_car_model
  before_action :set_model_type, only: [:show, :edit, :update, :destroy]

  # GET /model_types
  # GET /model_types.json
  def index
    @model_types = @car_model.model_types.all
  end

  # GET /model_types/1
  # GET /model_types/1.json
  def show
  end

  # GET /model_types/new
  def new
    @model_type = @car_model.model_types.new
  end

  # GET /model_types/1/edit
  def edit
  end

  # POST /model_types
  # POST /model_types.json
  def create
    @model_type = @car_model.model_types.new(model_type_params)

    respond_to do |format|
      if @model_type.save
        format.html { redirect_to car_model_model_type_path(@car_model, @model_type), notice: 'Model type was successfully created.' }
        format.json { render :show, status: :created, location: @model_type }
      else
        format.html { render :new }
        format.json { render json: @model_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /model_types/1
  # PATCH/PUT /model_types/1.json
  def update
    respond_to do |format|
      if @model_type.update(model_type_params)
        format.html { redirect_to car_model_model_type_path(@car_model, @model_type), notice: 'Model type was successfully updated.' }
        format.json { render :show, status: :ok, location: @model_type }
      else
        format.html { render :edit }
        format.json { render json: @model_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /model_types/1
  # DELETE /model_types/1.json
  def destroy
    @model_type.destroy
    respond_to do |format|
      format.html { redirect_to car_model_model_type_path(@car_model, @model_type), notice: 'Model type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model_type
      @model_type = @car_model.model_types.where(model_type_slug: params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_type_params
      params.require(:model_type).permit(:name, :model_type_slug, :model_type_code, :base_price, :car_model_id)
    end
		
    def set_car_model
      @car_model = CarModel.where(model_slug: params[:car_model_id]).first
    end
end
