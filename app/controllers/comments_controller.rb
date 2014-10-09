class CommentsController < ApplicationController
  def create
    if params[:video_id]
      render json: Video.find(params[:video_id]).comments.create(
        content: params[:content],
        user_id: current_user.id
      )
    end
  end

  def update

  end

  def destroy

  end
end
