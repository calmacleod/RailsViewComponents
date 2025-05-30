class Views::Users::Show < Views::Base
  def initialize(user:)
    @user = user
  end

  def page_title = @user.name

  def layout = Layout

  def view_template
    div do
      h1 do
        @user.name
      end

      p do
        @user.email_address
      end
    end
  end
end
