class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  
  # Se non sei autenticato, non puoi vedere nulla
  before_action :authenticate_user!
  # , except: [:index]
  # Verifica se sei l'utente giusto quando vuoi editare, modificare o distruggere.
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  # GET /posts or /posts.json
  def index
    @posts = Post.all

    @post = current_user.posts.build
  end

  # GET /posts/1 or /posts/1.json
  def show
    # redirect_to posts_path
  end

  # GET /posts/new
  def new
    # @post = Post.new
    # redirect_to :controller => 'post', :action => 'index'
redirect_to posts_path
    # @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)
    # @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_url, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    # Cerca l'associazione tramite id
	  @post = current_user.posts.find_by(id: params[:id])
    # Ti porta nella home
    redirect_to posts_path, notice: "Not authorized" if @post.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description, :tags, :user_id, :user_email, :user_username)
    end
end
