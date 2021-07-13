class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    binding.pry
  end
end
