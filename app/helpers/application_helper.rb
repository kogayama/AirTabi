module ApplicationHelper
  def user_image_url(user)
    "http://graph.facebook.com/#{user.uid}/picture?type=large"
  end
end
