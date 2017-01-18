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
    @applies = current_user.receiver_applies.apply_status.includes(:author)
  end

  def operate_apply
    @apply = current_user.receiver_applies.find(params[:apply_id])
    if params[:operate] == "pass"
      @apply.pass!
    elsif params[:operate] == "reject"
      @apply.reject!
    end
    # @apply.create_user_friends_relationship
    head :no_content

  end

  private
  def apply_params
    params.require(:apply).permit(:receiver_id, :details)
  end


end
