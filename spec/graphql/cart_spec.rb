# frozen_string_literal: true

require 'rails_helper'

describe 'Cart', type: :mutation do
  include GraphqlHelper

  describe 'cart' do
    let(:cart) do
      <<-GQL
            mutation cart($email: String! $password: String!) {
                signIn(email: $email password: $password) {
                    session {
                        token
                    }
                }
            }
      GQL
    end
  end
end
