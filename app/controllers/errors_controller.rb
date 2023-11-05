class ErrorsController < ApplicationController
  def not_found
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end
end
