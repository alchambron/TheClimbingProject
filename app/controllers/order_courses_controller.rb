class OrderCoursesController < ApplicationController
  before_action :set_order_course, only: %i[show edit update destroy]

  # GET /order_courses or /order_courses.json
  def index
    @order_courses = OrderCourse.where(user_id: current_user.id)
  end

  # GET /order_courses/1 or /order_courses/1.json
  def show
    @order_course = OrderCourse.find(params[:id])
  end

  # GET /order_courses/new
  def new
    return if session[:user_id].nil?
    return if session[:cart].nil? || session[:cart].length == 0

    @order_course = OrderCourse.create(user_id: session[:user_id])
    session[:cart].each { |course_id| OrderRow.create(order: @order_course, course_id: course_id) }
  end

  # GET /order_courses/1/edit
  def edit; end

  def book_course
    session[:book_course] = OrderCourse.new(course_id: params[:course_id], user_id: current_user.id, date: params[:date])
    redirect_to(checkout_create_path, remote: true)
  end

  # POST /order_courses or /order_courses.json
  def create
    @order_course = OrderCourse.new(order_course_params)

    respond_to do |format|
      if @order_course.save
        format.html { redirect_to(order_course_url(@order_course), notice: 'Order course was successfully created.') }
        format.json { render(:show, status: :created, location: @order_course) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @order_course.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /order_courses/1 or /order_courses/1.json
  def update
    respond_to do |format|
      if @order_course.update(order_course_params)
        format.html { redirect_to(order_course_url(@order_course), notice: 'Order course was successfully updated.') }
        format.json { render(:show, status: :ok, location: @order_course) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @order_course.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /order_courses/1 or /order_courses/1.json
  def destroy
    @order_course.destroy

    respond_to do |format|
      format.html { redirect_to(order_courses_url, notice: 'Order course was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order_course
    @order_course = OrderCourse.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_course_params
    params.fetch(:order_course, {})
  end
end
