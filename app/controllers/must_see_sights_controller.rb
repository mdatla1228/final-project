class MustSeeSightsController < ApplicationController


  def show
    the_id = params.fetch("path_id")

    matching_must_see_sights = MustSeeSight.where({ :id => the_id })

    @the_must_see_sight = matching_must_see_sights.at(0)

    render({ :template => "must_see_sights/show.html.erb" })
  end

  def create
    the_must_see_sight = MustSeeSight.new
    the_must_see_sight.city_id = params.fetch("query_city_id")
    the_must_see_sight.user_id = params.fetch("query_user_id")
    the_must_see_sight.body = params.fetch("query_body")
    the_must_see_sight.name = params.fetch("query_name")

    if the_must_see_sight.valid?
      the_must_see_sight.save
      redirect_to("/must_see_sights", { :notice => "Must see sight created successfully." })
    else
      redirect_to("/must_see_sights", { :alert => the_must_see_sight.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_must_see_sight = MustSeeSight.where({ :id => the_id }).at(0)

    the_must_see_sight.city_id = params.fetch("query_city_id")
    the_must_see_sight.user_id = params.fetch("query_user_id")
    the_must_see_sight.body = params.fetch("query_body")
    the_must_see_sight.name = params.fetch("query_name")

    if the_must_see_sight.valid?
      the_must_see_sight.save
      redirect_to("/must_see_sights/#{the_must_see_sight.id}", { :notice => "Must see sight updated successfully."} )
    else
      redirect_to("/must_see_sights/#{the_must_see_sight.id}", { :alert => the_must_see_sight.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_must_see_sight = MustSeeSight.where({ :id => the_id }).at(0)

    the_must_see_sight.destroy

    redirect_to("/must_see_sights", { :notice => "Must see sight deleted successfully."} )
  end
end
