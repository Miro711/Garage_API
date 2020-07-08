class Api::V1::CarsController < Api::ApplicationController
    def create
        car = Car.new car_params
        car.person_id = params[:person_id]
        car.save!
        render json: {id: car.id}
    end

    def show
        render json: car
    end

    def destroy
        car.destroy
        render(json: { status: 200 }, status: 200)
    end

    def update
        car.update!(car_params)
        render json: { id: car.id }
    end

    private

    def car
        @car ||= Car.find params[:id]
    end

    def car_params
        params.require(:car).permit(:year, :make, :model, :price)
    end
end
