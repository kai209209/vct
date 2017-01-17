class AppliesController < ApplicationController
  def index
    
  end

  def apply
    @apply = current_user.author_applies.find_by(receiver_id: params[:receiver_id])
    render json: @apply
  end

  def create
    @apply = current_user.author_applies.new(apply_params.merge(apply_status: 0))
    if @apply.save
      render json: @apply
    else
      render json: { error: @apply.errors.messages}, status: 422
    end
  end

  def reapply
    @apply = current_user.author_applies.find(params[:id])
    @apply.apply!
    render json: @apply
  end

  def my_applies
    @author_applies = current_user.author_applies
    @receiver_applies = current_user.receiver_applies
    render json: {author_applies: @author_applies, receiver_applies: @receiver_applies}
  end

  def operate_apply
    
  end

  private
  def apply_params
    params.require(:apply).permit(:receiver_id, :details)
  end


end
