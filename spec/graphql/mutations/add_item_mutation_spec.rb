require "rails_helper"

RSpec.describe Mutations::AddItemMutation do
  let(:query) do
    <<~GRAPHQL
      mutation AddItemMutation(
        $title: String!
        $description: String
        $imageUrl: String
      ) {
        addItem(title: $title, description: $description, imageUrl: $imageUrl) {
          item {
            id
            title
            description
            imageUrl
            user {
              id
              email
            }
          }
        }
      }
    GRAPHQL
  end

  it "adds an item" do
    user = create(:user)
    result = nil

    expect do
      result = MartianLibrarySchema.execute(
        query,
        variables: {
          "title" => "Cat's playground",
          "description" => "A beautiful cat playing with mouse",
          "imageUrl" => "http://example.com/images/qwe123.jpg"
        },
        context: { current_user: user }
      ).as_json
    end.to change(Item, :count).from(0).to(1)

    item = Item.first

    expect(result).to match(
      "data" => {
        "addItem" => {
          "item" => {
            "description" => "A beautiful cat playing with mouse",
            "id" => item.id.to_s,
            "imageUrl" => "http://example.com/images/qwe123.jpg",
            "title" => "Cat's playground",
            "user" => {
              "email" => user.email,
              "id" => user.id.to_s
            }
          }
        }
      }
    )
  end
end
