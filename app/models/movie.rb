class Movie < ActiveRecord::Base

def poster

# Testing to IMDB   
# "http://ia.media-imdb.com/images/M/#{poster_url}"
# Testing to Komplett
#"http://www.komplett.ie/components/webhandlers/pimpicture.ashx?productnumber=#{poster_url}&catalogcode=KOIE&maximumwidth=200&maximumheight=150&picturetypecode=highresolution"
# Testing to Arest
"http://www.arest.pl/ph/#{poster_url}/1_addmedium.jpg"
# Testing to Localhost
#def poster
#    "public/img/add"
  end

  def imdb
    # "http://www.imdb.com/title/#{imdb_id}/"
  end

  def cart_action(current_user_id)
    if $redis.sismember "cart#{current_user_id}", id
      "Remove from"
    else
      "Add to"
    end
  end
end
