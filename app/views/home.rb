class Views::Home < Views::Base
  def initialize(user_name:)
    @user_name = user_name
  end

  def page_title = "Home"
  def layout = Layout

  def view_template
    div do
      h1 class: "text-2xl font-bold my-4" do
        "Welcome to my app, #{@user_name}"
      end

      h3 do
        "Is this small?"
      end

      render Components::ReasonList.new(reasons: [
        "It's free",
        "It's easy to use",
        "It's fast"
      ])

      button class: "btn btn-netural", data_controller: "click", data_action: "click#click" do
        "Click me"
      end

      div do
        a href: test_path, class: "font-medium text-blue-600 dark:text-blue-500 hover:underline" do
          "Test"
        end
      end

      div do
        a href: users_path, class: "font-medium text-blue-600 dark:text-blue-500 hover:underline" do
          "Users"
        end
      end

      div do
        a href: new_session_path, class: "font-medium text-blue-600 dark:text-blue-500 hover:underline" do
          "Sign in"
        end
      end

    end
  end
end
