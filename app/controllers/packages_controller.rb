class PackagesController < ApplicationController
    before_action :authenticate_user!
    helper_method :sort_column, :sort_direction

    def index
        @package = Package.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
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
    def edit
        @package = Package.find(params[:package_id])
    end

    def update
        @package = Package.find(params[:package_id])
        if @package.update(package_params)
            flash[:success] = "Mail updated"
            redirect_to packages_path
        else
            render 'edit'
        end
    end
    
    def show
        @package = Package.find(params[:id])
    end

    private
    def package_params
        params.require(:package).permit(:sender_name,:sent_date,:destination,:mail_type,:mail_number,:description)
    end
    def sort_column
        Package.column_names.include?(params[:sort]) ? params[:sort] : "mail_number"
    end
  
      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
end