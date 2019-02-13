class Api::V1::CommentsController < ApplicationController
  before_action :authenticate!

  def create
      @comment = Comment.new(comment_params)
      @comment.city_gem_id = params[:city_gem_id]
      @comment.user_id = current_user.id
      if @comment.save
        render json: @comment.to_json(include: :user), status: :created
      else
        render json: { errors: @comment.errors.full_messages }, status: :conflict
      end
  end

    def edit
      @comment = Comment.find(params[:id])
    end

     def update
      @comment = Comment.update(comment_params)
      render json: @comment
     end

  private

    def set_comment
    @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :user_id, :city_gem_id)
    end

end
