class SharedFilesController < ApplicationController
  def index
    @shared_files = SharedFile.select(:title, :summary, :category, :updated_at, :path).all
  end

  def new
    @shared_file = SharedFile.new
    @errors = @shared_file.errors
    @categories = SharedFile.select(:category).distinct
  end

  def create
    @shared_file = SharedFile.new(params.require(:shared_file).permit(:title, :summary, :category, :path))
    if @shared_file.save
      redirect_to shared_files_path
    else
      #创建文件失败时，由于@categories的生命周期已经结束，重新渲染new模板时，@categories已经没有值了，所以就没有下拉列表了
      @categories = SharedFile.select(:category).distinct
      @errors = @shared_file.errors
      render 'new'
    end
  end

  private

end
