json.extract! car, :id, :car_plate_number, :manufacturer, :model, :manufacture_year, :color, :renting_price, :available, :created_at, :updated_at
json.url car_url(car, format: :json)
