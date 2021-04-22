require 'swagger_helper'

describe 'Users API' do
  path '/api/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: { 
          user: {
            type: :object,
              properties: {
                email: { type: :string },
                password: { type: :string },
                username: { type: :string }
              }
          },
        },
      },
      required: ['email', 'password', 'username']


      response '200', 'OK' do
        schema type: :object,
          properties: { 
            user: {
              type: :object,
                properties: {
                  email: { type: :string },
                  password: { type: :string },
                  username: { type: :string },
                  token: { type: :string}
                }
            },
          }
        run_test!
      end

      response '400', 'Bad Request' do
        run_test!
      end

      response '422', 'Error: Unprocessable Entity' do
        run_test!
      end
    end
  end

  path '/api/users/login' do
    post 'Login user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: { 
          user: {
            type: :object,
              properties: {
                email: { type: :string },
                password: { type: :string },
                username: { type: :string }
              }
          },
        },
      },
      required: ['email', 'password', 'username']

      response '200', 'OK' do
        schema type: :object,
          properties: { 
            user: {
              type: :object,
                properties: {
                  email: { type: :string },
                  password: { type: :string },
                  username: { type: :string },
                  token: { type: :string}
                }
            },
          }
        run_test!
      end

      response '422', 'Error: Unprocessable Entity' do
        run_test!
      end
    end
  end

  path '/api/user' do
    get 'Shows user information' do
      tags 'Users'
      produces 'application/json'
      security [Authorization: {}]

      response '200', 'OK' do
        schema type: :object,
          properties: { 
            user: {
              type: :object,
                properties: {
                  email: { type: :string },
                  password: { type: :string },
                  username: { type: :string },
                  token: { type: :string}
                }
            },
          }
        run_test!
      end

      response '401', 'Unauthorized' do
        run_test!
      end
    end
  end

  path "/api/user" do
    put 'Updates user information' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      security [Authorization: {}]
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: { 
          user: {
            type: :object,
              properties: {
                email: { type: :string },
                password: { type: :string },
                username: { type: :string }
              }
          },
        },
      }
      response '200', 'OK' do
        schema type: :object,
          properties: { 
            user: {
              type: :object,
                properties: {
                  email: { type: :string },
                  password: { type: :string },
                  username: { type: :string },
                  token: { type: :string}
                }
            },
          }
        run_test!
      end

      response '400', 'Bad Request' do
        run_test!
      end

      response '401', 'Unauthorized' do
        run_test!
      end

    end
  end
end
