class ToysController < ApplicationController
  def index
    @toys = Toy.all
    render template: "toys/index"
  end

  def show
    @toy = Toy.find_by(id: params[:id])
    render template: "toys/show"
  end

  def new
    @toy = Toy.new
    render :new
  end

  def create
    @toy = Toy.new(
      name: params[:name],
      price: params[:price],
      image: params[:image],
    )
    if @toy.save
      # happy path
      redirect_to "/toys"
    else
      # sad path
      render json: { errors: @toy.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
    @toy = Toy.find_by(id: params[:id])
    render :edit
  end

  def update
    @toy = Toy.find_by(id: params[:id])
    @toy.update(
      name: params[:name] || toy.name,
      price: params[:price] || toy.price,
      image: params[:image] || toy.image,
    )
    if @toy.valid?
      # happy path
      redirect_to "/toys"
    else
      # sad path
      render json: { errors: @toy.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @toy = Toy.find_by(id: params[:id])
    @toy.destroy
    redirect_to "/toys", status: :see_other
  end
end
