class Product < ActiveRecord::Base

has_many :purchases
has_many :buyers, through: :purchases

# Getting Images
def image
"http://www.arest.pl/ph/#{image_url}/1_addmedium.jpg"
end

def product_id
end  

def cart_action(current_user_id)
if $redis.sismember "cart#{current_user_id}", id
      "Remove from"
else
      "Add to"
end
end
end

