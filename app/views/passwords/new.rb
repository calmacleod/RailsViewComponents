class Views::Passwords::New < Views::Base
  include Phlex::Rails::Helpers::EmailField
  include Phlex::Rails::Helpers::Flash
  include Phlex::Rails::Helpers::FormWith
  include Phlex::Rails::Helpers::Routes

  attr_accessor :params

  def initialize(params:)
    @params = params
  end

  def page_title = "Forgot your password?"
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
      h1(class: "font-bold text-4xl") { "Forgot your password?" }
      whitespace
      form_with url: passwords_path, class: "contents" do |form|
        div(class: "my-5") do
          whitespace
          plain form.email_field :email_address,
                                 required: true,
                                 autofocus: true,
                                 autocomplete: "username",
                                 placeholder: "Enter your email address",
                                 value: params[:email_address],
                                 class:
                                   "block shadow-sm rounded-md border border-gray-400 focus:outline-solid focus:outline-blue-600 px-3 py-2 mt-2 w-full"
        end
        div(class: "inline") do
          whitespace
          plain form.submit "Email reset instructions",
                            class:
                              "w-full sm:w-auto text-center rounded-lg px-3.5 py-2.5 bg-blue-600 hover:bg-blue-500 text-white inline-block font-medium cursor-pointer"
        end
        whitespace
      end
    end
  end
end
