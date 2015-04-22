require 'csv'
CSV.foreach(Rails.root.join("db/seeds_data/movies.csv"), headers: true) do |row|
  Product.find_or_create_by(name: row[0], date_added: row[1], price: row[2], description: row[3], product_id: row[4], image_url: row[5])
end
