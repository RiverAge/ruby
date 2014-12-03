class SharedFilesController < ApplicationController
  def index
    @shared_files = SharedFile.select(:title, :summary, :category, :updated_at, :path).all
  end

  def new
    @shared_file = SharedFile.new
    @categories = SharedFile.select(:category).distinct
  end

  def create
    @file = SharedFile.new(params.require(:shared_file).permit(:title, :summary, :category, :path))
    if @file.save
      redirect_to shared_files_path
    else
      render 'new'
    end

  end

end
