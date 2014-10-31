class PokemonsController < ApplicationController
	def capture
		@pokemon = Pokemon.find(params[:id])
		@pokemon.trainer_id = current_trainer.id
		@pokemon.save
		redirect_to root_path
	end

	def damage
		puts 7
		@pokemon = Pokemon.find(params[:id])
		@pokemon.health -= 10
		@pokemon.save
		if @pokemon.health <= 0
			@pokemon.destroy
		end
		puts 5
		redirect_to trainers_path
	end

	def new
		render 'new'
	end

	def create

	end

end
