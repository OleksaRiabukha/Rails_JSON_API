require 'swagger_helper'

describe 'Employees API' do
  path '/api/employees' do
    post 'Creates an employee' do
      tags 'Employees'
      consumes 'application/json'
      produces 'application/json'
      security [Authorization: {}]
      parameter name: :employee, in: :body, schema: {
        type: :object,
        properties: { 
          first_name: { type: :string },
          last_name: { type: :string },
          salary: { type: :integer }
        },
      },
      required: ['first_name', 'last_name', 'salary']


      response '200', 'OK' do
        schema type: :object,
          properties: { 
            first_name: { type: :string },
            last_name: { type: :string },
            salary: { type: :integer }
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

  path '/api/employees/{id}' do
    put 'Update employee details' do
      tags 'Employees'
      consumes 'application/json'
      produces 'application/json'
      security [Authorization: {}]
      parameter name: :id, in: :path, type: :string
      parameter name: :employee, in: :body, schema: {
        type: :object,
        properties: { 
          first_name: { type: :string },
          last_name: { type: :string },
          salary: { type: :integer }
        },
      },
      required: ['first_name', 'last_name', 'salary']

      response '200', 'OK' do
        schema type: :object,
          properties: { 
            first_name: { type: :string },
            last_name: { type: :string },
            salary: { type: :integer }
          }
        run_test!
      end

      response '400', 'Bad Request' do
        let(:employee) { {first_name: 'alex'} }
        run_test!
      end

      response '404', "Error: Not Found" do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end


  path '/api/employees' do
    get 'Show all employees' do
      tags 'Employees'
      produces 'application/json'
      security [Authorization: {}]

      response '200', 'OK' do
        schema type: :object,
          properties: { 
            first_name: { type: :string },
            last_name: { type: :string },
            salary: { type: :integer }
          }
      run_test!

      response '401', 'Unauthorized' do
        run_test!
      end
      end
    end
  end

  path '/api/employees/{id}' do
    get "Show employee details" do
      tags 'Employees'
      produces 'application/json'
      security [Authorization: {}]
      parameter name: :id, in: :path, type: :string

      response '200', 'OK' do
        schema type: :object,
        properties: { 
          first_name: { type: :string },
          last_name: { type: :string },
          salary: { type: :integer }
        }
      run_test!
      end

      response '404', "Error: Not Found" do
        run_test!
      end

      response '401', 'Unauthorized' do
        run_test!
      end
    end
  end

  path '/api/employees/{id}' do
    delete "Deletes employee details" do
      tags 'Employees'
      security [Authorization: {}]
      parameter name: :id, in: :path, type: :string

      response '204', 'No Content' do
      run_test!
      end

      response '404', "Error: Not Found" do
        run_test!
      end

      response '401', 'Unauthorized' do
        run_test!
      end
    end
  end
end
