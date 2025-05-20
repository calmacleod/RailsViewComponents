class Views::Users::Index < Views::Base
  def initialize(users:)
    @users = users
  end

  def page_title = "Users"

  def layout = Layout

  def view_template
    ul do
      @users.each do |user|
        li do
          a href: user_path(user) do
            user.name
          end
        end
      end
    end
  end
end
