module UsersHelper
  def get_user_name (user_id = 0)
    User.find(user_id).name
  rescue ActiveRecord::RecordNotFound
    "None"
  end
end
