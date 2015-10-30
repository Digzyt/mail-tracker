class PackagesController < ApplicationController
    before_action :authenticate_user!
    
    
    def index
        @package = Package.all
    end
    
    def new
        @package = Package.new
        @package.sender_name = current_user.first_name + " " + current_user.last_name
        @package.sent_date = Time.now
    end
    def create
        @package = Package.new(package_params)
        if @package.save
            redirect_to'package/index'
        else
            redirect_to 'package/new'
        end
    end
    
    private
    def package_params
        params.require(:package).permit(:sender_name,:sent_date,:destination,:mail_type,:mail_number,:description)
    end
    def show
        @package = Package.find(params[:id])
    end
end