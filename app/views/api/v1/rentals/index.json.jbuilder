json.rentals do
  json.array! @rentals do |rental|
    json.extract! rental, :id, :name, :category, :occasion, :size, :available, :rented, :color, :user_id, :image
  end
end
