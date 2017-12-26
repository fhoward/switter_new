class SwitsController < ApplicationController
  before_action :set_swit, only: [:show, :edit, :update, :destroy]

  def new
  
    @maximum_length = Swit.validators_on( :content ).first.options[:maximum]
  end

  
  def create
    @swit = Swit.new(swit_params) do |swit|
      swit.user = current_user
    end
    if @swit.save
      redirect_to home_path
    else
      redirect_to home_path, alert: @post.errors.full_messages.first
    end
  end

 
  def upvote 
    @swit = Swit.find_by_id(params[:id])
    @swit.upvote_by current_user
    redirect_to home_path
  end  
  
  def downvote
    @swit = Swit.find_by_id(params[:id])
    @swit.downvote_by current_user
    redirect_to home_path
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swit
      @swit = Swit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swit_params
      params.require(:swit).permit(:content, :user_id)
    end
end
