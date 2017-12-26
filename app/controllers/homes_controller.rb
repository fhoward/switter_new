class HomesController < ApplicationController
  
    def index
        @swit = Swit.new
        @swits = Swit.all

    end

end
