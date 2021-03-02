class DailyTripsController < ApplicationController
    def create
        @daily_trip = DailyTrip.where(date: params[:date]).order(created_at: :desc)
        if @daily_trip.present?
            @row = @daily_trip.first.row
            @column = @daily_trip.first.column
            @seat = @daily_trip.first.seat_number
            case @row
            when 1
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 1, column: 4, seat_number: @seat+1) if @column == 3
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 1, column: 7, seat_number: @seat+1) if @column == 4
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 1, column: 8, seat_number: @seat+1) if @column == 7
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 1, column: 9, seat_number: @seat+1) if @column == 8
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 1, column: 10, seat_number: @seat+1) if @column == 9
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 2, column: 3, seat_number: @seat+1) if @column == 10
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 1, column: 5, seat_number: @seat+1) if @column == 2
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 1, column: 12, seat_number: @seat+1) if @column == 1
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 2, column: 1, seat_number: @seat+1) if @column == 12
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 1, column: 6, seat_number: @seat+1) if @column == 5
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 1, column: 11, seat_number: @seat+1) if @column == 6
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 2, column: 2, seat_number: @seat+1) if @column == 11
                return render json: {message: "Seat Booked Successfully"}, status: 200
            when 2
                return render json: {message: "All seats are filled"}, status: 422 if @column == 5
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 2, column: 5, seat_number: @seat+1) if @column == 2
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 2, column: 12, seat_number: @seat+1) if @column == 1
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 3, column: 9, seat_number: @seat+1) if @column == 12
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 2, column: 4, seat_number: @seat+1) if @column == 3
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 2, column: 7, seat_number: @seat+1) if @column == 4
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 2, column: 8, seat_number: @seat+1) if @column == 7
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 2, column: 9, seat_number: @seat+1) if @column == 8
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 2, column: 10, seat_number: @seat+1) if @column == 9
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 3, column: 1, seat_number: @seat+1) if @column == 10
                return render json: {message: "Seat Booked Successfully"}, status: 200
            when 3
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 3, column: 4, seat_number: @seat+1) if @column == 1
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 3, column: 5, seat_number: @seat+1) if @column == 4
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 3, column: 6, seat_number: @seat+1) if @column == 5
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 3, column: 7, seat_number: @seat+1) if @column == 6
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 4, column: 1, seat_number: @seat+1) if @column == 7
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 3, column: 1, seat_number: @seat+1) if @column == 10
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 2, column: 2, seat_number: @seat+1) if  @column == 11
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 4, column: 3, seat_number: @seat+1) if @column == 9
                return render json: {message: "Seat Booked Successfully"}, status: 200
            when 4
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 1, column: 1, seat_number: @seat+1) if @column == 1
                @daily_trip = DailyTrip.create!(name: params[:name], date: params[:date], row: 1, column: 2, seat_number: @seat+1) if @column == 3
                return render json: {message: "Seat Booked Successfully"}, status: 200
            end
        else
            @daily_trip = DailyTrip.create!(params.permit(:name, :date).merge(row: 1, column: 3, seat_number: 1))
            return render json: {message: "Seat Booked Successfully"}, status: 200
        end
    end
end
