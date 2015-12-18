class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :edit, :update, :destroy]

  # GET /pokemons
  # GET /pokemons.json
  def index
    @myPokemon = []
    @pokemons = Pokemon.all
  end

  # GET /pokemons/1
  # GET /pokemons/1.json
  def show
    @photo = "gray.jpg"
    if @pokemon.Name == "kote" or @pokemon.Name == "Kote"
      @photo = "surprise.jpg"
    else
      @photo = "gray.jpg"
    end
    
  end
 
  
  def viewMyPokemon
    @myPokemon = []
    @pokemons = Pokemon.all
    @pokemons.each do |i|
       if i.Caught
         @myPokemon.push(i)
       end
     end
  end
   
  def viewMyShiny
    @myShinyPokemon = []
    @pokemons = Pokemon.all
    @pokemons.each do |i|
       if i.Shiny
         @myShinyPokemon.push(i)
       end
     end
  end
  
  def viewNotCaught
    @notMyPokemon = []
    @pokemons = Pokemon.all
    @pokemons.each do |i|
       if i.Caught == false
         @notMyPokemon.push(i)
       end
     end
  end
  
  def findPokemon
    puts "----- find pokemon------"
    @poke = File.read("justForPassing.txt")
    @allPokemon = File.read("allPokemon.txt")
    @allPokemon = @allPokemon.split("\n")
    @pokemonList = []
    @allPokemon.each do |x|
      @pokemonList.push(x)
    end
    @pokemons = Pokemon.all
    @pokemons.each do |x|
      if x.Name == @poke
        @pokemon = x
      end
    end
  end
  
  
  # GET /pokemons/new
  def new
    @pokemon = Pokemon.new
  end

  # GET /pokemons/1/edit
  def edit
  end

  # POST /pokemons
  # POST /pokemons.json
  def create
    realPokemon = false 
    @pokemon = Pokemon.new(pokemon_params)
    @allPokemon = File.read("allPokemon.txt")
    @pokemonList = @allPokemon.split("\n")
    @pokemonList.each do |x|
      if x == @pokemon.Name
        realPokemon = true
      end
    end
    respond_to do |format| 
      if realPokemon == false
        format.html { redirect_to @pokemon, notice: 'Pokémon could not be created; not a valid Pokémon'}
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      elsif @pokemon.save
        format.html { redirect_to @pokemon, notice: 'Pokémon was successfully created.' }
        format.json { render :show, status: :created, location: @pokemon }
      else
        format.html { render :new }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pokemons/1
  # PATCH/PUT /pokemons/1.json
  def update
    respond_to do |format|
      @allPokemon = File.read("allPokemon.txt")
      @pokemonList = @allPokemon.split("\n")
      realPokemon = false
      @pokemonList.each do |x|
      if x == pokemon_params[:Name]
        realPokemon = true
        end
      end
      if realPokemon == false
        format.html { redirect_to @pokemon, notice: 'Pokémon could not be updated; not a valid Pokémon'}
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      elsif @pokemon.update(pokemon_params)
        format.html { redirect_to @pokemon, notice: 'Pokémon was successfully updated.' }
        format.json { render :show, status: :ok, location: @pokemon }
      else
        format.html { render :edit}
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pokemons/1
  # DELETE /pokemons/1.json
  def destroy
    @pokemon.destroy
    respond_to do |format|
      format.html { redirect_to pokemons_url, notice: 'Pokémon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
  
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pokemon_params
      params.require(:pokemon).permit(:Number, :Name, :Type, :Level, :Ability, :Height, :Weight, :Gender, :Caught, :Location_Caught, :Level_Caught, :Shiny, :PC, :Can_Evolve)
    end      
end
