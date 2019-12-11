require 'rails_helper'

include GraphqlHelper

describe 'User', type: :mutation do
    describe 'createUser' do
        let(:create_session) {<<-GQL
            mutation createSession($email: String! $password: String!) {
                signIn(email: $email password: $password) {
                    session {
                        token
                    }
                }
            }
        GQL
        }
        let(:session) {
            OpenStruct.new (gql_response.data['signIn']['session'])
        }
        let(:create_mutation) {
            mutation create_session, variables: {
                email: 'john@mail.com',
                password: '1'
            }
        }

        context 'when it is an invalid e-mail or password' do
            it 'should return errors' do
                create_mutation

                expect(gql_response.errors.first['message']).to eq(
                    'Invalid e-mail or password'
                )
            end
        end

        context 'when it is a valid e-mail and password' do
            let!(:user) { FactoryBot.create :user }

            it 'should create a session with a token' do
                create_mutation

                expect(session.token)
            end
        end
    end
end