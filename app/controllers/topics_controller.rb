class TopicsController < ApplicationController
  load_and_authorize_resource
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column,:sort_direction

  expose :topic
  # GET /topics
  # GET /topics.json
  def index
    if params[:sort] == "created_at"
            @topics = Topic.order(sort_column + ' ' + sort_direction).page(params[:page]).per(8)

    else
        @topics = Topic.page(params[:page]).per(8).left_joins(:comments)
        .group(:id)
        .order('COUNT(comments.id) DESC')
    end

  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topics = Topic.find(params[:id])
    @comments = @topics.comments.page(params[:page]).per(10).order(created_at: :desc)
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
      if @topic.save
        redirect_to @topic, notice: 'Topic was successfully created.'
      else
        render :new 
      end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update

      if @topic.update(topic_params)
        redirect_to @topic, notice: 'Topic was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy

    redirect_to topics_url, notice: 'Topic was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:name, :desc, :published)
    end
  def sort_column
    Topic.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
