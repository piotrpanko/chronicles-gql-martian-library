require "rails_helper"

RSpec.describe Types::QueryType do
  describe "me" do
    let(:query) do
      <<~GRAPHQL
        query {
          me {
            id
            fullName
          }
        }
      GRAPHQL
    end

    it 'returns user' do
      current_user = create(:user)
      result = MartianLibrarySchema.execute(
        query,
        context: { current_user: current_user },
      ).as_json
      expect(result['errors']).to be_blank, result['errors']
      expect(result).to match({
                                'data' => {
                                  'me' => {
                                    'id' => current_user.id.to_s,
                                    'fullName' => [current_user.first_name, current_user.last_name].compact.join(" ")
                                  }
                                }
                              })
    end
    it 'returns empty result' do
      current_user = nil
      result = MartianLibrarySchema.execute(
        query,
        context: { current_user: current_user },
      ).as_json
      expect(result['errors']).to be_blank, result['errors']
      expect(result).to match({ 'data' => {  'me' => nil } })
    end
  end

  describe "items" do
    let(:query) do
      <<~GRAPHQL
        query {
          items {
            id
            title
            user {
              email
            }
          }
      GRAPHQL
    end
    it "returns all items" do
      items = create_list(:item, 2)
      result = MartianLibrarySchema.execute(query).as_json
      expect(result['errors']).to be_blank, result['errors'].inspect
      expect(result.dig("data", "items").size).to eq(2)
      expect(result.dig("data", "items")).to match_array(
                                               items.map { |item| { "title" => item.title } }
                                             )
    end
  end
end
