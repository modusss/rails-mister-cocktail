require 'json'
require 'open-uri'

Cocktail.destroy_all
Ingredient.destroy_all

20.times do

  url = "http://www.thecocktaildb.com/api/json/v1/1/random.php"
  cocktail_serialized = open(url).read
  cock = JSON.parse(cocktail_serialized)

  cocktail = Cocktail.new(name: cock['drinks'][0]['strDrink'])
  cocktail.remote_photo_url = cock['drinks'][0]['strDrinkThumb']
  cocktail.save

end

ingredients = %w(lemon ice mint leaves redbull jagermeister sugar tonic gin rhum)
ingredients.each { |ingredient| Ingredient.create(name: ingredient) }


#cocktails.each { |cocktail| Cocktail.create(cocktail) }
