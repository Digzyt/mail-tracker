class PackageController < ApplicationController
    
    def index
        @package = Package.all
    end
    
    def new
        @package = Package.new
    end
    def create
        @package = Package.new(package_params)
        if @package.save
            package[:sent_date] = Time.now
            redirect_to'/'
        else
            redirect_to 'package/new'
        end
    end
    
    private
    def package_params
        params.require(:package).permit(:destination,:type,:mail_number,:description,:recipient_name)
    end
    def show
        @package = Package.find(params[:id])
    end
end