class DashboardController < ApplicationController
  def index
  	@topics = Topic.page(params[:page]).per(4).left_joins(:comments)
        .group(:id)
        .order('COUNT(comments.id) DESC')
    @news = News.order(created_at: :desc).page(params[:page]).per(4)
  end
end