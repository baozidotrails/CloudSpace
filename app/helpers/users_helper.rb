module UsersHelper

  def set_title(partial)
    unless partial.blank?
      "baozidotrails | #{partial}"
    else
      "baozidotrails"
    end
  end

  def gravatar_for(user, option = { size:50 })
    gr_id = Digest::MD5::hexdigest(user.email.downcase)
    size = option[:size]
    gr_url = "https://secure.gravatar.com/avatar/#{gr_id}.png?s=#{size}"
    image_tag(gr_url, alt: user.name)
  end

end
