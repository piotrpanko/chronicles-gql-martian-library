require "rails_helper"

RSpec.describe Types::MutationType do
  describe "sign_in" do
    let(:query) do
      <<~GRAPHQL
        mutation SignMeIn($email: String!, $password: String!) {
          signIn(email: $email, password: $password) {
            token
            user {
              id
              fullName
            }
          }
        }
      GRAPHQL
    end

    it "signs in a user" do
      user = create(:user)

      result = MartianLibrarySchema.execute(
        query,
        variables: {
          "email" => user.email,
          "password" => "qwe123"
        }
      ).as_json

      expect(result).to match(
        "data" => {
          "signIn" => {
            "token" => "dXNlci0xQGV4YW1wbGUuY29t",
            "user" => {
              "fullName" => "",
              "id" => user.id.to_s
            }
          }
        }
      )
    end
    it "returns unauthorized" do
      result = MartianLibrarySchema.execute(
        query,
        variables: {
          "email" => "bill@gates.com",
          "password" => "qwe123"
        }
      ).as_json

      expect(result).to match(
        "data" => {
          "signIn" => nil
        }
      )
    end
  end

  describe "add_item" do
  end

  describe "update_item" do
  end
end
