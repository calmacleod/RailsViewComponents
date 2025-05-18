class HomeController < ApplicationController
  def index
    render Views::Home.new(
      user_name: params[:name] || "Anonymous User"
    )
  end
end
