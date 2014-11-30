class SharedFilesController < ApplicationController
  def index
    @sharedfiles = Sharedfile.select(:title, :summary, :category, :updated_at, :path).all
  end

  def new
    @sharedfile = Sharedfile.new
    @categories = Sharedfile.select(:category).distinct
  end

  def create
    @file = Sharedfile.new(params.require(:sharedfile).permit(:title, :summary, :category, :path))
    if @file.save
      redirect_to shared_files_path
    else
      render 'new'
    end

  end

end
