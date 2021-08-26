module Types
  class QueryType < Types::BaseObject
    field :me, Types::UserType, null: true
    field :item,
          Types::ItemType,
          null: false,
          description: 'Reruns single item' do
      argument :id, ID, required: true
    end
    field :items,
          [Types::ItemType],
          null: false,
          description: "Returns a list of items in the martian library" do
      argument :by_title, String, required: false
    end

    def item(id: )
      Item.find(id)
    end

    def items(by_title: nil)
      items = Item.preload(:user)
      items = items.where(title: by_title) if by_title.present?
      items
    end

    def me
      context[:current_user]
    end
  end
end
