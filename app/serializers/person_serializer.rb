class PersonSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :first_name,
    :last_name
  )

  has_many(:cars)

  def cars
    object.cars.order("created_at desc")
  end

  class CarSerializer < ActiveModel::Serializer
    attributes :id, :year, :make, :model, :price, :person_id
  end
end
