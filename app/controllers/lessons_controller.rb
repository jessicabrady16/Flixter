class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, only: [:show]
  def show
  end

  private
  def require_authorized_for_current_lesson
    unless current_user == current_lesson.section.course.user || current_user.enrolled_courses.include?(current_lesson.section.course)
      flash[:notice] = "You must enroll in this course to access premium content!"
      redirect_to current_lesson.section.course
    end
  end

  helper_method :current_lesson

  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

end
