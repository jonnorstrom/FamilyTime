module CommentsHelper
  def is_own_comment?(comment)
    comment.user_id == current_user.id
  end

  def has_superiority?(comment)
    current_user.is_admin && !User.find(comment.user_id).is_admin
  end
end
