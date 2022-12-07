class CentersController < ApplicationController
  before_action :set_center, only: %i[ show edit update destroy ]

  # GET /centers or /centers.json
  def index
    @centers = Center.all
  end

  # GET /centers/1 or /centers/1.json
  def show
  end

  # GET /centers/new
  def new
    @center = Center.new
  end

  # GET /centers/1/edit
  def edit
  end

  # POST /centers or /centers.json
  def create
    @center = Center.new(center_params)

    respond_to do |format|
      if @center.save
        format.html { redirect_to center_url(@center), notice: "Center was successfully created." }
        format.json { render :show, status: :created, location: @center }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /centers/1 or /centers/1.json
  def update
    respond_to do |format|
      if @center.update(center_params)
        format.html { redirect_to center_url(@center), notice: "Center was successfully updated." }
        format.json { render :show, status: :ok, location: @center }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /centers/1 or /centers/1.json
  def destroy
    @center.destroy

    respond_to do |format|
      format.html { redirect_to centers_url, notice: "Center was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_center
      @center = Center.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def center_params
      params.require(:center).permit(:name)
    end
end
