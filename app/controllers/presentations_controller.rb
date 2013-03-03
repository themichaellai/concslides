class PresentationsController < ApplicationController
  def new
    if user_signed_in?
      @presentation = Presentation.new
    else
      redirect_to root_path
    end
  end

  def create
    @presentation = Presentation.new(params[:presentation])
    @presentation.user = current_user
    if @presentation.save
      flash[:notice] = 'Created presentation'
      redirect_to new_presentations_path
    else
      flash[:notice] = 'Could not create presentation'
      redirect_to new_presentations_path
    end
  end
end
