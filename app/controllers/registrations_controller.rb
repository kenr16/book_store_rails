class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

# Initializing the user with account and order.
    resource.account = Account.create(name: resource.name)
    resource.save
    resource.account.orders.create

    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def destroy
  resource.account.orders.destroy_all
  id = resource.account_id
  resource.destroy
  Account.find(id).destroy
  Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
  set_flash_message! :notice, :destroyed
  yield resource if block_given?
  respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
