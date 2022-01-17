class ActivitiesController < ApplicationController

    def index
        render json: Activity.all
    end

    def destroy
        find_activity.destroy
        head :no_content
    end

    private

    def find_activity
        Activity.find(params[:id])
    end

    def render_not_found
        render json: { error: "Activity not found"}, status: :not_found
      end

    
end
