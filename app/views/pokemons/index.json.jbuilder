json.array!(@pokemons) do |pokemon|
  json.extract! pokemon, :id, :Number, :Name, :Type, :Level, :Ability, :Height, :Weight, :Gender, :Caught, :Location_Caught, :Level_Caught, :Shiny, :PC, :Can_Evolve
  json.url pokemon_url(pokemon, format: :json)
end
