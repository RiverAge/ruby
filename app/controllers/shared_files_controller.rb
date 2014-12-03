class SharedfilesController < ApplicationController
  def index
    @shared_files = shared_file.select(:title, :summary, :category, :updated_at, :path).all
  end

  def new
    @shared_file = shared_file.new
    @categories = shared_file.select(:category).distinct
  end

  def create
    @file = shared_file.new(params.require(:shared_file).permit(:title, :summary, :category, :path))
    if @file.save
      redirect_to shared_files_path
    else
      render 'new'
    end

  end

end
