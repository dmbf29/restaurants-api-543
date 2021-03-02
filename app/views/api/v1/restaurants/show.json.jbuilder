json.extract! @restaurant, :id, :name, :address, :hello
json.comments @restaurant.comments do |comment|
  json.extract! comment, :id, :content
end

