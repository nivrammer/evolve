module UserpostsHelper
  def user_name
    userpost.user.profile.first_name + " " + userpost.user.profile.last_name.html_safe
  end
end
