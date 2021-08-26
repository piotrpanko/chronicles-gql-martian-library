require "rails_helper"

RSpec.describe Types::MutationType do
  describe 'sign_in' do
    let(:mutation) do
      <<~GRAPHQL
        mutation SignMeIn($email: String!) {
          signIn(email: $email) {
            token
            user {
              id
              fullName
            }
          }
        }
      GRAPHQL
    end
  end

  describe 'add_item' do

  end

  describe 'update_item' do

  end
end