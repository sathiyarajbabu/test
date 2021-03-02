require 'rails_helper'
RSpec.describe 'DailyTrip', type: :request do
    let!(:daily_trip) { FactoryBot.create(:daily_trip) }
    let(:valid_details) do
    {
      name:'testuser',
      date: "2021-03-04"
    }.to_json
    end
    describe 'POST /localhost:3006/daily_trips' do
        context 'when valid details' do
        before { post '/daily_trips', params: valid_details }
            it 'returns success code' do
                expect(response).to have_http_status(200)
            end
        end
    end
end