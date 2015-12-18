require 'open-uri'
class PokedexController < ApplicationController
  def index
    puts "--index--"
  end

  
  def viewPC
     puts "--------viewPC--------"
     #
  end


  def viewEntry
    puts "--------In view Pokemon--------"
    number = params[:numberInput]
    entry = {"Number" => number}
    @pokemons = Pokemon.all
    for i in @pokemons do
      if i.Number == number.to_i
        File.open('justForPassing.txt', 'w') {|file| file.truncate(0) }
        f = File.open("justForPassing.txt", "w") 
        f.write(i.Name)
        f.close()
        respond_to do |format|
          format.html {redirect_to "/pokemons/findPokemon"}
        end
      end
    end
  end
  
  
  def viewAllPokemon
    puts "--------In view all Pokemon--------"
    @allPokemon = []
    page = open("http://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_National_Pok%C3%A9dex_number").read
    page_body = page.scan(/(<img.alt=..*?")/).flatten
    stringMarker1 = "<img alt=\""
    page_body.each do |i|
        inList = false
        i = i.remove("<img alt=\"")
        i = i.chomp("\"")
        @allPokemon.each do |k|
          if k == i
            inList = true
          end
        end
        @allPokemon.push(i) if inList == false
    end
    @allPokemon.push("Kote")
    f = File.open('allPokemon.txt', 'w') 
    @allPokemon.each do |j|
      f.write(j)
      f.write("\n")
    end
    f.close()
   end 
end