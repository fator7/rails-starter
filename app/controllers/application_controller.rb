class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  around_action :scope_current_tenant

  private

  def current_tenant
    Company.find_by( subdomain: request.subdomain )
  end

  def scope_current_tenant
    Company.current_id = current_tenant.id if current_tenant
    yield
  ensure
    Company.current_id = nil
  end
end
