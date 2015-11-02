class PackagesController < ApplicationController
    before_action :authenticate_user!
    helper_method :sort_column, :sort_direction

    def index
        @package = Package.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per_page(5)
    end
    
    def new
        @package = Package.new
        @package.mail_number = rand(36**8).to_s(36)
        @package.sender_name = current_user.first_name + " " + current_user.last_name
        @package.sender_id = current_user.id
        @package.sent_date = Time.now
    end
    def create
        @package = Package.new(package_params)
        if @package.save && @package.mail_type == "envelope" && @package.destination == "other"
            redirect_to controller: 'packages', action: 'show', id: @package.id
        elsif @package.save && @package.destination == "organization"
            redirect_to '/packages'
        else
            redirect_to '/packages/new'
        end
    end
    def edit
        @package = Package.find(params[:id])
        if current_user.mailman?
            @package.mail_room_date = Time.now
        else
            @package.received_date = Time.now
        end
            
    end

    def update
        @package = Package.find(params[:id])
        sender_id = @package.sender_id
        @sender = User.find(sender_id)
        email = @sender.email
        name = (current_user.first_name + " " + current_user.last_name)
        if @package.update(package_params)
            ReceivedMailer.received_email(name,email).deliver
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
        params.require(:package).permit(:sender_name,:sent_date,:destination,:mail_type,:mail_number,:description,:status,:mail_room_date,:mail_room_status,:sender_id,:recipient_user_name)
    end
    def sort_column
        Package.column_names.include?(params[:sort]) ? params[:sort] : "mail_number"
    end
  
      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
end