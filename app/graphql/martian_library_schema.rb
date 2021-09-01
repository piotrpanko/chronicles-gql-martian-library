class MartianLibrarySchema < GraphQL::Schema
  UnauthorizedAction = Class.new(StandardError)
  mutation(Types::MutationType)
  query(Types::QueryType)
end
