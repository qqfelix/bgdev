class WelcomeController < ApplicationController
  before_filter :is_logged
  def index
  end


  def demo

  end

  def showdemo
    render :plain => params[:question].inspect
  end
end
