class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.integer :Number
      t.string :Name
      t.string :Type
      t.integer :Level
      t.string :Ability
      t.float :Height
      t.float :Weight
      t.string :Gender
      t.boolean :Caught
      t.string :Location_Caught
      t.integer :Level_Caught
      t.boolean :Shiny
      t.boolean :PC
      t.boolean :Can_Evolve

      t.timestamps null: false
    end
  end
end
