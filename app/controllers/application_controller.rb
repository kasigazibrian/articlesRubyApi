# frozen_string_literal: true

class ApplicationController < ActionController::API
  def not_found
    render json: { error: 'not_found' }
  end

  rescue_from CanCan::AccessDenied do |_exception|
    render json: { error: 'Forbidden to perform action' }, status: :forbidden
  end
end
