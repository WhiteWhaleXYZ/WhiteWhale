module PodsHelper

  # Returns the Gravatar for the given pod.
  def gravatar_for(pod)
    gravatar_id = Digest::MD5::hexdigest(pod.description.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.id, class: "gravatar")
  end

end
