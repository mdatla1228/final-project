class CountriesController < ApplicationController
  def home
  
    redirect_to("/countries")
  end

  def index
    matching_countries = Country.all

    @list_of_countries = matching_countries.order({ :created_at => :desc })

    render({ :template => "countries/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_countries = Country.where({ :id => the_id })

    @the_country = matching_countries.at(0)

    render({ :template => "countries/show.html.erb" })
  end

  def create
    the_country = Country.new
    the_country.name = params.fetch("query_name")
    the_country.body = params.fetch("query_body")

    if the_country.valid?
      the_country.save
      redirect_to("/countries", { :notice => "Country created successfully." })
    else
      redirect_to("/countries", { :alert => the_country.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_country = Country.where({ :id => the_id }).at(0)

    the_country.name = params.fetch("query_name")
    the_country.body = params.fetch("query_body")

    if the_country.valid?
      the_country.save
      redirect_to("/countries/#{the_country.id}", { :notice => "Country updated successfully."} )
    else
      redirect_to("/countries/#{the_country.id}", { :alert => the_country.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_country = Country.where({ :id => the_id }).at(0)

    the_country.destroy

    redirect_to("/countries", { :notice => "Country deleted successfully."} )
  end
end
