class MembershipsController < ApplicationController
    wrap_parameters format: []

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def create
        membership = Membership.create(membership_params)
        render json: membership
    end

    private

    def render_not_found_response
        render json: { error: "Membership not found" }, status: :not_found
    end

    def membership_params
        params.permit(:name, :address)
    end
end
