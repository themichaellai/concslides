class PresentationsController < ApplicationController
  def new
    if user_signed_in?
      @presentation = Presentation.new
    else
      redirect_to root_path
    end
  end

  def index
    if user_signed_in?
      @presentations = current_user.presentations.all
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @presentation = Presentation.new(params[:presentation])
    @presentation.user = current_user
    if @presentation.save
      flash[:notice] = 'Created presentation'
      redirect_to user_presentations(current_user)
    else
      flash[:notice] = 'Could not create presentation'
      redirect_to new_presentations_path(current_user)
    end
  end

  def show
    @presentation = Presentation.find(params[:id])
    if current_user != @presentation.user
      # TODO: if current_user != presentation.user, then redirect to public view, else render normal page
    end
  end

  def present
    @presentation = Presentation.find(params[:id])
    if params[:view] =='pub'
      render 'presentations/pub', layout: "presentation"
    elsif params[:view] == 'pres'
      render 'presentations/pres', layout: "presentation"
    else
      redirect_to user_presentation_pub_path(view: 'pub')
    end
  end
end
