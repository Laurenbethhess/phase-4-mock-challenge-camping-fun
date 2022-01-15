class CampersController < ApplicationController

    def index
        render json: Camper.all
    end

    def show
        render json: find_camper, serializer: CamperWithActivitiesSerializer
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

    def find_camper
        Camper.find(params[:id])
    end

    def render_record_not_found
        render json: { error:  "Camper not found" }, status: :not_found
    end
end
