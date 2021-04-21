json.employee do |json|
  json.partial! 'employees/employee', employee: @employee
end