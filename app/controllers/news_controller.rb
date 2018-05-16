class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]


  # GET /news
  # GET /news.json
  def index
    @news = News.order(created_at: :desc).page(params[:page]).per(10)
  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create

    @news = News.new(news_params)
    @news.user = current_user

      if @news.save
        redirect_to @news, notice: 'News was successfully created.'
      else
        render :new 
      end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
      if @news.update(news_params)
        redirect_to @news, notice: 'News was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
      redirect_to news_index_url, notice: 'News was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:name, :desc, :image)
    end
end
