class ToysController < ApplicationController
  def index
    @toys = Toy.all
    render template: "toys/index"
  end

  def show
    name = params[:name]
    @toy = Toy.find_by(id: name)
    render template: "toys/show"
  end

  def create
    toy = Toy.new(
      name: params[:name],
      price: params[:price],
      image: params[:image],
    )
    if toy.save
      # happy path
      render json: toy.as_json
    else
      # sad path
      render json: { errors: toy.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    name = params[:name]
    toy = Toy.find_by(id: name)
    toy.update(
      name: params[:name] || toy.name,
      price: params[:price] || toy.price,
      image: params[:image] || toy.description,
    )
    if toy.valid?
      # happy path
      render json: toy.as_json
    else
      # sad path
      render json: { errors: toy.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    toy = Toy.find_by(id: params[:id])
    toy.destroy
    render json: { message: "Toy Destroyed" }
  end
end
