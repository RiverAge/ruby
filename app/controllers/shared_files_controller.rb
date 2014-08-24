class SharedFilesController < ApplicationController
  def index
    @sharedfiles = Sharedfile.all
  end

  def new
    @sharedfile = Sharedfile.new
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
