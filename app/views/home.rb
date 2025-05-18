class Views::Home < Views::Base
  def initialize(user_name:)
    @user_name = user_name
  end

  def page_title = "Home"

  def view_template
    h1 { "Welcome to my app, #{@user_name}" }

    render Components::ReasonList.new(reasons: [
      "It's free",
      "It's easy to use",
      "It's fast"
    ])
  end
end
