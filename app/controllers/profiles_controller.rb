class ProfilesController < ApplicationController
    def create
        @profile = Profile.create!(params.permit(:first_name, :last_name, :email, :age, :date_of_birth))
        return render json: {message: "Profile created successfully"}, status: 200
    end

    def index
        @profile = Profile.all
        return render json: @profile, :except => [:created_at, :updated_at]
    end
end
