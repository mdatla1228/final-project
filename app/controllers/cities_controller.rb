class CitiesController < ApplicationController
  def index
    matching_cities = City.all

    @list_of_cities = matching_cities.order({ :created_at => :desc })

    render({ :template => "cities/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_cities = City.where({ :id => the_id })

    @the_city = matching_cities.at(0)

    render({ :template => "cities/show.html.erb" })
  end

  def create
    the_city = City.new
    the_city.country_id = params.fetch("query_country_id")
    the_city.name = params.fetch("query_name")
    the_city.user_id = params.fetch("query_user_id")
    the_city.body = params.fetch("query_body")

    if the_city.valid?
      the_city.save
      redirect_to("/countries/#{the_city.country_id}", { :notice => "City created successfully." })
    else
      redirect_to("/countries/#{the_city.country_id}", { :alert => the_city.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_city = City.where({ :id => the_id }).at(0)

    the_city.country_id = params.fetch("query_country_id")
    the_city.name = params.fetch("query_name")
    the_city.user_id = session.fetch(:user_id)
    the_city.body = params.fetch("query_body")

    if the_city.valid?
      the_city.save
      redirect_to("/cities/#{the_city.id}", { :notice => "City updated successfully."} )
    else
      redirect_to("/cities/#{the_city.id}", { :alert => the_city.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_city = City.where({ :id => the_id }).at(0)

    the_city.destroy

    redirect_to("/cities", { :notice => "City deleted successfully."} )
  end
end
