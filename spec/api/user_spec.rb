require 'rails_helper'

include GraphqlHelper

describe 'User', type: :mutation do
    describe 'createUser' do
        let(:create_user) {<<-GQL
            mutation createUser(
                $email: String!
                $name: String!
                $password: String!
            ) {
                createUser(
                    email: $email
                    name: $name
                    password: $password
                ) {
                    user {
                        name
                        email
                    }
                }
            }
        GQL
        }
        let(:user) {
            OpenStruct.new (gql_response.data['createUser']['user'])
        }

        before do
            mutation create_user, variables: {
                email: 'john@mail.com',
                name: 'John',
                password: '1'
            }
        end

        context 'when a user has all the required inputs' do
            it 'should return no errors' do
                expect(gql_response.errors).to be_nil
            end

            it 'should create an user with all the required data' do
                expect(user.name).to eq('John')
                expect(user.email).to eq('john@mail.com')
            end
        end
    end
end