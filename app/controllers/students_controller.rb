class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def edit

  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    redirect_to students_path,notice: "#{@student.name} was created !" if @student.save
  end
  def update
    redirect_to students_path,notice: "#{@student.name} was updated !"  if @student.update(student_params)
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_path, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
      format.js { render layout: false }
    end

  end


  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :address, :phone_number)
  end

end
