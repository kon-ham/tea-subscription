require "rails_helper"

RSpec.describe "Subscriptions" do
    before :each do 
        @customer = Customer.create(
            first_name: "Bob", 
            last_name: "McBobster",
            email: "bob@mcbobster.com", 
            address: "123 ABC St, Charlotte NC, 28226"
        )

        @subscription = @customer.subscriptions.create({
            title: "entry",
            price: "15.99",
            status: "1",
            frequency: "1",
        })

        @body = {
            title: "entry",
            price: "15.99",
            status: "1",
            frequency: "1",
            email: "bob@mcbobster.com"
        }
    end

    describe 'endpoint creation' do
        it 'the POST - subscription endpoint exists' do
            post '/api/v1/subscriptions', params: @body
            expect(response).to be_successful
            expect(response.status).to eq(200)
        end

        it "the PATCH - cancel a customer's subscription endpoint exists" do
            body = {
                status: "0",
                email: "bob@mcbobster.com"
            }

            patch "/api/v1/subscriptions/#{@subscription.id}", params: body

            expect(response).to be_successful
            expect(response.status).to eq(200)
        end

        it "the GET - get all of a customer's subscription endpoint exists" do
            body = {
                email: "bob@mcbobster.com"
            }
            get '/api/v1/subscriptions/', params: body
            
            expect(response).to be_successful
            expect(response.status).to eq(200)
        end
    end

    describe 'create a subscription' do
        it 'HAPPY PATH it can create a new subscription for a customer' do
            post '/api/v1/subscriptions', params: @body
            subscription = JSON.parse(response.body, symbolize_names: true)

            expect(subscription[:message]).to eq("Subscription has been created")
            expect(response).to be_successful
            expect(response.status).to eq(200)
        end

        it 'SAD PATH it cannot create a new subscription for a customer' do
            body = {
                title: "",
                price: "15.99",
                status: "1",
                frequency: "1",
                email: "bob@mcbobster.com"
            }
            post '/api/v1/subscriptions', params: body
            subscription = JSON.parse(response.body, symbolize_names: true)

            expect(subscription[:errors]).to eq("Field is blank or incorrect data was given for fields")
            expect(response).to_not be_successful
            expect(response.status).to eq(400)
        end
    end

    describe 'cancel a subscription' do
        it 'HAPPY PATH can cancel a subscription for a customer' do
            body = {
                status: "0",
            }

            patch "/api/v1/subscriptions/#{@subscription.id}", params: body
            subscription = JSON.parse(response.body, symbolize_names: true)

            expect(subscription[:message]).to eq("Subscription has been updated")
            expect(response).to be_successful
            expect(response.status).to eq(200)
        end

        it 'SAD PATH can cancel a subscription for a customer' do
            body = {
                status: "asdf"
            }

            patch "/api/v1/subscriptions/#{@subscription.id}", params: body
            subscription = JSON.parse(response.body, symbolize_names: true)

            expect(subscription[:errors]).to eq("Incorrect status code given")
            expect(response).to_not be_successful
            expect(response.status).to eq(400)
        end
    end

    describe 'get all subscriptions by customer' do
        it 'HAPPY PATH can get all subscriptions by customer' do
            body = {
                email: "bob@mcbobster.com"
            }

            get "/api/v1/subscriptions/", params: body

            subscription = JSON.parse(response.body, symbolize_names: true)
            expect(response.status).to eq(200)
            expect(response).to be_successful
            
            expect(subscription[:data].count).to eq(1)
            expect(subscription[:data].first[:attributes]).to have_key(:title)
            expect(subscription[:data].first[:attributes]).to have_key(:price)
            expect(subscription[:data].first[:attributes]).to have_key(:status)
            expect(subscription[:data].first[:attributes]).to have_key(:frequency)
        end

        it 'SAD PATH can get all subscriptions by customer (no email exists)' do
            body = {
                email: "asdf@asdf.com"
            }

            get "/api/v1/subscriptions/", params: body
            subscription = JSON.parse(response.body, symbolize_names: true)

            expect(subscription[:errors]).to eq("No subscription exists or Customer does not exist")
        end
    end
end