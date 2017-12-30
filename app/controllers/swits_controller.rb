class SwitsController < ApplicationController
  before_action :set_swit, only: [:show, :edit, :update, :destroy]
  ActsAsTaggableOn.delimiter = '{'
  def new
    @maximum_length = Swit.validators_on( :content ).first.options[:maximum]
  end
  
  def show
    @swit = Swit.find(params[:id])
  end

  def create
    @swit = Swit.new(swit_params)
    @swit.user = current_user
    
    respond_to do |format|
      if @swit.save
        format.html { redirect_to home_path, notice: 'Swit was successfully created.' }
        format.json { render :show, status: :created, location: @swit }
      else
        format.html { redirect_to home_path, alert: @swit.errors.full_messages.first }
        format.json { render json: @swit.errors, status: :unprocessable_entity }
      end
    end
  end
  
 
  def upvote 
    @swit = Swit.find_by_id(params[:id])
    @swit.upvote_by current_user
    redirect_back(fallback_location: home_path)
  end  
  
  def downvote
    @swit = Swit.find_by_id(params[:id])
    @swit.downvote_by current_user
    redirect_back(fallback_location: home_path)
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swit
      @swit = Swit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swit_params
      params.require(:swit).permit(:content, :user_id, :tag_list)
    end
end
