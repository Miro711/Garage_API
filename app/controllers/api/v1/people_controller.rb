class Api::V1::PeopleController < Api::ApplicationController

  def create
    person = Person.new person_params
    person.save!
    render json: { id: person.id }
  end

  def show
    render json: person
  end

  def index
    people = Person.order(created_at: :desc)
    render json: people
  end

  def destroy
    person.destroy
    render(json: { status: 200 }, status: 200)
  end

  def update
    person.update!(person_params)
    render json: { id: person.id }
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :email)
  end

  def person
    @person ||= Person.find params[:id]
  end

end