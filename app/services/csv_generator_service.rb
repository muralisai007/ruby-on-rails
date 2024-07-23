# app/services/csv_generator_service.rb

class CsvGeneratorService
  require 'csv'
def generate_csv(employees)
    headers = ['First Name', 'Last Name', 'Phone Number', 'Status', 'Salary']

    CSV.generate(headers: true) do |csv|
      csv << headers
      employees.each do |employee|
        csv << [employee.first_name, employee.last_name, employee.phone_no, employee.status == 1 ? 'Active' : 'Inactive', employee.salary]
      end
    end
  end
end
