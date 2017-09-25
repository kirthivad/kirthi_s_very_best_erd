class CuisinesController < ApplicationController
  def index
    @cuisines = Cuisine.all

    render("cuisines/index.html.erb")
  end

  def show
    @dish = Dish.new
    @cuisine = Cuisine.find(params[:id])

    render("cuisines/show.html.erb")
  end

  def new
    @cuisine = Cuisine.new

    render("cuisines/new.html.erb")
  end

  def create
    @cuisine = Cuisine.new

    @cuisine.name = params[:name]

    save_status = @cuisine.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cuisines/new", "/create_cuisine"
        redirect_to("/cuisines")
      else
        redirect_back(:fallback_location => "/", :notice => "Cuisine created successfully.")
      end
    else
      render("cuisines/new.html.erb")
    end
  end

  def edit
    @cuisine = Cuisine.find(params[:id])

    render("cuisines/edit.html.erb")
  end

  def update
    @cuisine = Cuisine.find(params[:id])

    @cuisine.name = params[:name]

    save_status = @cuisine.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cuisines/#{@cuisine.id}/edit", "/update_cuisine"
        redirect_to("/cuisines/#{@cuisine.id}", :notice => "Cuisine updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Cuisine updated successfully.")
      end
    else
      render("cuisines/edit.html.erb")
    end
  end

  def destroy
    @cuisine = Cuisine.find(params[:id])

    @cuisine.destroy

    if URI(request.referer).path == "/cuisines/#{@cuisine.id}"
      redirect_to("/", :notice => "Cuisine deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Cuisine deleted.")
    end
  end
end
