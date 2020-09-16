module ApplicationHelper
  def user_image_url(user)
    if user.image
      "http://graph.facebook.com/#{user.uid}/picture?type=large"
    else
      "no-image.png"
    end
  end
end

