class Api::V1::SubscriptionsController < ApplicationController
    def index
        render json: {  }, status: :ok
    end

    def create
        customer = Customer.find_by(email: params[:email])
        subscription = customer.subscriptions.create(subscription_params)
        if subscription.save
            render json: { message: "Subscription has been created" }, status: :ok
        else
            render json: { errors: "Field is blank or incorrect data was given for fields" }, status: :bad_request
        end
    end

    def update
        subscription = Subscription.find(params[:subscription_id])
        subscription.status = params[:status]
        if subscription.save
            render json: { message: "Subscription has been updated" }, status: :ok
        else
            render json: { errors: "Incorrect status code given" }, status: :bad_request
        end
    end

    private
    
    def subscription_params
        params.permit(:title, :price, :status, :frequency)
    end
end