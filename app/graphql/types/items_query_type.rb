module Types
  module ItemsQueryType
    extend ActiveSupport::Concern
    included do
      field :item,
            Types::ItemType,
            null: false,
            description: "Reruns single item" do
        argument :id, Types::BaseObject::ID, required: true
      end

      def item(id:)
        Item.find(id)
      end

      field :items,
            [Types::ItemType],
            null: false,
            description: "Returns a list of items in the martian library" do
        argument :by_title, String, required: false
      end

      def items(by_title: nil)
        items = Item.preload(:user)
        items = items.where(title: by_title) if by_title.present?
        items
      end
    end
  end
end
