class RegistrationsController < Devise::RegistrationsController

  def destroy
    #resource.destroy
    #set_flash_message :notice, :destroyed
    #sign_out_and_redirect(self.resource)
    render :json => "ask your administrator", :status => 401
  end

end
