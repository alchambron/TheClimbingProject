class OrderCoursesController < ApplicationController
  before_action :set_order_course, only: %i[ show edit update destroy ]

  # GET /order_courses or /order_courses.json
  def index
    @order_courses = OrderCourse.all
  end

  # GET /order_courses/1 or /order_courses/1.json
  def show
  end

  # GET /order_courses/new
  def new
    @order_course = OrderCourse.new
  end

  # GET /order_courses/1/edit
  def edit
  end

  # POST /order_courses or /order_courses.json
  def create
    @order_course = OrderCourse.new(order_course_params)

    respond_to do |format|
      if @order_course.save
        format.html { redirect_to order_course_url(@order_course), notice: "Order course was successfully created." }
        format.json { render :show, status: :created, location: @order_course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_courses/1 or /order_courses/1.json
  def update
    respond_to do |format|
      if @order_course.update(order_course_params)
        format.html { redirect_to order_course_url(@order_course), notice: "Order course was successfully updated." }
        format.json { render :show, status: :ok, location: @order_course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_courses/1 or /order_courses/1.json
  def destroy
    @order_course.destroy

    respond_to do |format|
      format.html { redirect_to order_courses_url, notice: "Order course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_course
      @order_course = OrderCourse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_course_params
      params.require(:order_course).permit(:course_id, :user_id)
    end
end