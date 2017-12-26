class HomesController < ApplicationController
    def new
        @swit = Swit.new
        
    end
    def index
        @swit = Swit.new
        @swits = Swit.all
       
    end

end
