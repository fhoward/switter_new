class HomesController < ApplicationController
  
    def index
        @swit = Swit.new
        @swits = Swit.all
    end
    
    def show
        if params[:tag]
            @swits = Swit.tagged_with(params[:tag])
          else
            @swits = Swit.all
        end
    end
end
