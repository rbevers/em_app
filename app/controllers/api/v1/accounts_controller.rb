class Api::V1::AccountsController < ApplicationController
  doorkeeper_for :all

  def show
    return head(:not_authorized) if !current_resource_owner
    render json: current_resource_owner, status: :ok
  end

private
  def current_resource_owner
    @user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
