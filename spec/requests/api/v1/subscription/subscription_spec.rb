require "rails_helper"

RSpec.describe "Subscriptions" do
    describe 'happy path' do
        it 'POST can create a subscription' do
            body = {
                title: "entry",
                price: "15.99",
                status: "1",
                frequency: "1",
                email: "bob@bob.com"
            }
            post '/api/v1/subscriptions', params: body
            subscription = JSON.parse(response.body, symbolize_names: true)

            expect(response).to be_successful
            expect(response.status).to eq(200)
        end

        it "PATCH can cancel a customer's subscription" do
            body = {
                status: "0"
            }
            patch "/api/v1/subscriptions/:id", params: body
            subscription = JSON.parse(response.body, symbolize_names: true)

            expect(response).to be_successful
            expect(response.status).to eq(200)
        end

        it "GET can get all of a customer's subscription" do
            body = {
                email: "bob@bob.com"
            }
            get '/api/v1/subscriptions/', params: body
            subscription = JSON.parse(response.body, symbolize_names: true)
            
            expect(response).to be_successful
            expect(response.status).to eq(200)
        end
    end
end