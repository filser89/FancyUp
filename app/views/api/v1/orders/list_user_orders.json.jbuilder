json.orders do
  json.array! @orders do |order|
    json.extract! order, :id, :start_date, :end_date, :status, :address
    json.start_date order.start_date.strftime("%b %d, %Y")
    json.end_date order.end_date.strftime("%b %d, %Y")

    json.user do
      json.extract! order.user, :id, :first_name, :last_name, :nickName, :email, :avatarUrl
    end
    json.rental do
      json.extract! order.rental, :id, :name, :category, :occasion, :size, :color, :image
      json.owner do
        json.extract! order.rental.user, :id, :first_name, :last_name, :nickName, :email, :avatarUrl
      end
    end
  end
end


