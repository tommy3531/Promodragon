json.extract! card, :id, :title, :imdb, :twitter, :user_id, :created_at, :updated_at
json.url card_url(card, format: :json)
