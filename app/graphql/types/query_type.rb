module Types
  class QueryType < Types::BaseObject
    field :me, Types::UserType, null: true

    include ItemsQueryType

    def me
      context[:current_user]
    end
  end
end
