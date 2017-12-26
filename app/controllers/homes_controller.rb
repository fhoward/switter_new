class HomesController < ApplicationController
    def new
       
        
    end
    def index
        @swit = Swit.new
        @swits = Swit.all

    end

end
