module UsersHelper
  def print_user_name (user_id)
    User.find(user_id).name
  end
end
