json.extract! news, :id, :name, :desc, :created_at, :updated_at
json.url news_url(news, format: :json)
