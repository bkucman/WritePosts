class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_comment, :set_model, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.page(params[:page]).per(10).order(created_at: :desc)

  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.create(comment_params)
    #comment = @model.comments.new comment_params

    @comment.user = current_user
      if @comment.save
        redirect_to topic_path(@topic), notice: 'Comment was successfully created.'
      else
        format.html { render :new }
      end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
      if @comment.update(comment_params)
        redirect_to topic_path(@comment.topic), notice: 'Comment was successfully updated.'
      else
        render :edit 
      end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @topicD = @comment.topic
    @comment.destroy
    redirect_to @topicD, notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_model
      @model = Topic.find(params[:topic_id]) if params[:topic_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:desc, :published,:topic_id)
    end
end
