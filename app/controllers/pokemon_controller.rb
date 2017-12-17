class PokemonController < ApplicationController
  def show

    res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
    body = JSON.parse(res.body)
    name  = body["name"]
    id = body["id"]
    types = body["types"][0]["name"]

    res = HTTParty.get("https://api.giphy.com/v1/gifs/search?search?api_key=#{Rails.application.secrets.pokemon_key}&q=bulbasaur&rating=g")
    body = JSON.parse(res.body)
    gif_url = body["data"][0]["url"]

    render json: { "message": "ok" }

  end
end
