module PodsHelper
include ActsAsTaggableOn::TagsHelper


  # Returns the Gravatar for the given pod.
  def gravatar_for(pod)
    gravatar_id = Digest::MD5::hexdigest(pod.description.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.id, class: "gravatar")
  end

  def pod_user?
    if (params[:user_id] && @user = User.find(params[:user_id]) && current_user?(@user))
      true
    else
      false
    end
  end
end
