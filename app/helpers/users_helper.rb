module UsersHelper
  def avatar_for(user, options = {size: 200})
    size = options[:size]
    if !user.avatar.file.nil?
      image_tag user.avatar.url(:display), size: size
    else
      image_tag 'default.png', size: size
    end
  end
end
