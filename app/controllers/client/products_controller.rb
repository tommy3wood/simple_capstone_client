class Client::ProductsController < ApplicationController
  def index
    response = HTTP.get("http://localhost:3000/api/products")
    @products = response.parse
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    client_params = {
                      name: params[:name],
                      price: params[:price],
                      description: params[:description],
                      image_url: params[:image_url],
                      }
    response = HTTP.post(
                          "http://localhost:3000/api/products",
                          form: client_params
                          )
    render 'create.html.erb'
  end

  def show
    response = HTTP.get("http://localhost:3000/api/products/#{params[:id]}")
    @product = response.parse
    render 'show.html.erb'
  end
end
