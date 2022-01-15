class SignupsController < ApplicationController

    def create
        signup = Signup.create!(signups_params)
        render json: signup.activity, status: :created
    end

    private

    def signups_params
        params.permit(:camper_id, :activity_id, :time)
    end
end
