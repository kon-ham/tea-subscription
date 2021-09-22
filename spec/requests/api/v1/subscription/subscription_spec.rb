require "rails_helper"

RSpec.describe "POST subscriptions" do
    describe 'happy path' do
        it 'can create a session when a user logs in' do
            headers = {
                'Content-Type' => "application/json",
                'Accept' => "application/json"
            }
            body = {
                "title": "entry",
                "price": "15.99",
                "status": "shipped",
                "frequency": "1"
            }
            post '/api/v1/subscriptions', headers: headers, params: body.to_json
            session = JSON.parse(response.body, symbolize_names: true)

            expect(response).to be_successful
            expect(response.status).to eq(200)
        end
    end
end