class Views::Test < Views::Base
  def page_title = "Test"
  def layout = Layout

  def view_template
    div do
      h1 { "Test Other" }
    end
  end
end
