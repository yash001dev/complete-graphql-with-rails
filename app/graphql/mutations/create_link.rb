module Mutations
  class CreateLink < Mutations::BaseMutation
    #argument passed to the reslove method
    argument :url, String, required: true
    argument :description, String, required: true

    #return type from the mutation
    type Types::LinkType

    def resolve(description: nil, url: nil)
      Link.create!(
        description: description,
        url: url,
      )
    end
  end
end
