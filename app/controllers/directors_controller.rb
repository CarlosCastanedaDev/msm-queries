class DirectorsController < ApplicationController
  def index 
    render({ :template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id })

    @the_director = matching_records.at(0)

    render({ :template => "director_templates/show"})
  end

  def eldest
    @eldest_director = Director.order(dob: :asc).where.not(dob: nil).first

    pp @eldest_director
    render({ :template => "director_templates/eldest"})
  end

  def youngest
    matching_record = Director.all.order({ :dob => :asc })

    @youngest_name = matching_record.last.name
    @youngest_id = matching_record.last.id
    youngest_age = matching_record.last.dob
    @youngest_date = youngest_age.strftime("%B %d, %Y")

    render({ :template => "director_templates/youngest"})
  end

end
