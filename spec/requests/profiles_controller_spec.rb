require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:profile) { create(:profile) }
  let(:valid_details) do
    {
      email:'new@yopmail.com',
      first_name: "test",
      last_name: "test",
      date_of_birth: "20-11-2020",
      age: 25
    }.to_json
  end
    describe 'POST /localhost:3006/profiles' do
    context 'when name blank' do
      before { post '/profiles', params: valid_details }
      
      # it 'returns error message' do
      #   expect(json['message']).to match("Name can't be blank")
      # end
      
      it 'returns error message' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'INDEX admins/specialities' do # speciality index API test case
    let(:speciality) { create(:speciality) }
    describe 'get profiles' do
      context 'when name invalid' do
        before { get '/profiles', headers: headers }
        it 'returns error message' do
          expect(response).to have_http_status(200)
        end
      end
    end
  end

end