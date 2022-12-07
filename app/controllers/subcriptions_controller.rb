class SubcriptionsController < ApplicationController
  before_action :set_subcription, only: %i[ show edit update destroy ]

  # GET /subcriptions or /subcriptions.json
  def index
    @subcriptions = Subcription.all
  end

  # GET /subcriptions/1 or /subcriptions/1.json
  def show
  end

  # GET /subcriptions/new
  def new
    @subcription = Subcription.new
  end

  # GET /subcriptions/1/edit
  def edit
  end

  # POST /subcriptions or /subcriptions.json
  def create
    @subcription = Subcription.new(subcription_params)

    respond_to do |format|
      if @subcription.save
        format.html { redirect_to subcription_url(@subcription), notice: "Subcription was successfully created." }
        format.json { render :show, status: :created, location: @subcription }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subcription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subcriptions/1 or /subcriptions/1.json
  def update
    respond_to do |format|
      if @subcription.update(subcription_params)
        format.html { redirect_to subcription_url(@subcription), notice: "Subcription was successfully updated." }
        format.json { render :show, status: :ok, location: @subcription }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subcription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subcriptions/1 or /subcriptions/1.json
  def destroy
    @subcription.destroy

    respond_to do |format|
      format.html { redirect_to subcriptions_url, notice: "Subcription was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subcription
      @subcription = Subcription.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subcription_params
      params.require(:subcription).permit(:name, :price)
    end
end
