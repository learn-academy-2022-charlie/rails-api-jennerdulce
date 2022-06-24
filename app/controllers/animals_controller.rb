class AnimalsController < ApplicationController
    def index
        animals = Animal.all
        render json: animals
    end

    def show
        animal = Animal.find(params[:id])
        sightings = animal.sightings
        render json: {animal: animal, sightings: sightings}
        # render json: animal.as_json(include: :sightings)
    end

    def create
        animal = Animal.create(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end
    end

    def destory
        animal = Animal.find(params[:id])
        animal.destroy
    end

    private
    # Strong parameter
    def animal_params
        params.require(:animal).permit(:common_name, :latin_name, :kingdom)
    end
end
