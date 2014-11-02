class PokemonsController < ApplicationController
	def capture
		@pokemon = Pokemon.find(params[:id])
		@pokemon.trainer_id = current_trainer.id
		@pokemon.save
		redirect_to root_path
	end

	def damage
		@pokemon = Pokemon.find(params[:id])
		@pokemon.health -= 10
		@pokemon.save
		redirect_to trainer_path(@pokemon.trainer_id)
	end

	def heal
		@pokemon = Pokemon.find(params[:id])
		@pokemon.health += 10
		@pokemon.save
		redirect_to trainer_path(@pokemon.trainer_id)
	end

	def new
		render 'new'
	end

	def create
		@pokemon = Pokemon.new(pokemon_params)
		if @pokemon.valid?
			@pokemon.trainer_id = current_trainer.id
			@pokemon.health = 100
			@pokemon.level = 1
			@pokemon.save
			redirect_to trainer_path(current_trainer.id)
		else 
			flash[:error] = @pokemon.errors.full_messages.to_sentence
			redirect_to new_pokemon_path
		end
	end

	def pokemon_params
    params.require(:pokemon).permit(:name)
  end

end
