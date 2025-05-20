class Views::Passwords::Edit < Views::Base
  include Phlex::Rails::Helpers::Flash
  include Phlex::Rails::Helpers::FormWith
  include Phlex::Rails::Helpers::PasswordField
  include Phlex::Rails::Helpers::Routes

  attr_accessor :params

  def initialize(params:)
    @params = params
  end

  def page_title = "Update your password"
  def layout = Layout

  def view_template
    div(class: "mx-auto md:w-2/3 w-full") do
      whitespace
      if alert = flash[:alert]
        p(
          class:
            "py-2 px-3 bg-red-50 mb-5 text-red-500 font-medium rounded-lg inline-block",
          id: "alert"
        ) { alert }
        whitespace
      end
      h1(class: "font-bold text-4xl") { "Update your password" }
      whitespace
      form_with url: password_path(params[:token]),
                method: :put,
                class: "contents" do |form|
        div(class: "my-5") do
          whitespace
          plain form.password_field :password,
                                    required: true,
                                    autocomplete: "new-password",
                                    placeholder: "Enter new password",
                                    maxlength: 72,
                                    class:
                                      "block shadow-sm rounded-md border border-gray-400 focus:outline-solid focus:outline-blue-600 px-3 py-2 mt-2 w-full"
        end
        div(class: "my-5") do
          whitespace
          plain form.password_field :password_confirmation,
                                    required: true,
                                    autocomplete: "new-password",
                                    placeholder: "Repeat new password",
                                    maxlength: 72,
                                    class:
                                      "block shadow-sm rounded-md border border-gray-400 focus:outline-solid focus:outline-blue-600 px-3 py-2 mt-2 w-full"
        end
        div(class: "inline") do
          whitespace
          plain form.submit "Save",
                            class:
                              "w-full sm:w-auto text-center rounded-md px-3.5 py-2.5 bg-blue-600 hover:bg-blue-500 text-white inline-block font-medium cursor-pointer"
        end
        whitespace
      end
    end
  end
end
