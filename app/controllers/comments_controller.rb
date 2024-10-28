class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @flat = Flat.find(params[:flat_id])
    @comment = @flat.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to flat_path(@flat), notice: "Votre commentaire a été ajouté."
    else
      redirect_to flat_path(@flat), alert: "Impossible d'ajouter le commentaire."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :rating)
  end
end
