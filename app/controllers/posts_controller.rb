class PostsController < ApplicationController

	def new
    @post = Post.new
	end
  
  def create 
 #~    render text: params[:post].inspect
    @post = Post.new(posts_params)
    
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  #  render :text @post
  end
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id]) 
    if @post.update(params[:post].permit(:title, :text))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to posts_path
  end


  private
    def posts_params
        params.require(:post).permit(:title, :text)
    end
  
end
