module Types
  class MutationType < Types::BaseObject
    field :sign_in, mutation: Mutations::SignInMutation
    field :test_field, String, null: false,
                               description: "An example field added by the generator"
    field :add_item, mutation: Mutations::AddItemMutation
    field :update_item, mutation: Mutations::UpdateItemMutation

    def test_field
      "Hello World"
    end
  end
end
