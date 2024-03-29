class PresentationsController < ApplicationController
  def new
    if user_signed_in?
      @presentation = Presentation.new
    else
      redirect_to root_path
    end
  end

  def controller
    presentation = Presentation.find(params[:id])
    unless user_signed_in? and current_user.id == presentation.user.id
      redirect_to user_presentation_pub_path(view: 'pub')
    end
  end

  def index
    @user = User.find(params[:user_id])
    @presentations = @user.presentations.all
  end

  def create
    @presentation = Presentation.new(params[:presentation])
    @presentation.user = current_user
    if @presentation.save
      flash[:notice] = 'Created presentation'
      redirect_to user_presentations_path(current_user)
    else
      flash[:notice] = 'Could not create presentation'
      redirect_to new_presentations_path(current_user)
    end
  end

  def edit
    @presentation = Presentation.find(params[:id])
    unless @presentation and user_signed_in? and current_user.id == @presentation.user.id
      redirect_to user_presentation_pub_path(view: 'pub')
    end
  end

  def update
    @presentation = Presentation.find(params[:id])
    if @presentation.update_attributes(params[:presentation])
      flash[:success] = 'Updated presentation'
      redirect_to user_presentation_path(current_user, @presentation)
    else
      flash[:error] = 'Failed to update'
      redirect_to edit_user_presentation_path(current_user, @presentation)
    end
  end


  def show
    @presentation = Presentation.find(params[:id])
    if current_user != @presentation.user
      redirect_to user_presentation_pub_path(view: 'pub')
    end
  end

  def present
    @presentation = Presentation.find(params[:id])
    @init_slide = $redis.get("presentation:#{@presentation.id}")
    if params[:view] =='pub'
      puts "INIT_SLIDE: #{@init_slide}"
      render 'presentations/pub', layout: "presentation"
      return
    elsif params[:view] == 'pres'
      unless user_signed_in? and current_user == @presentation.user
        redirect_to user_presentation_pub_path(view: 'pub')
        return
      end
      $redis.set("presentation:#{@presentation.id}", 0) # set slide position
      render 'presentations/pres', layout: "presentation"
      return
    else
      puts "INIT_SLIDE: #{@init_slide}"
      redirect_to user_presentation_pub_path(view: 'pub')
    end
  end
end
