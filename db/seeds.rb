# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Admin.create(email: "admin@example.com", password: "password", password_confirmation: "password")

# Companies
company1 = Company.create(name: "Tech Solutions Inc.", description: "A leading IT solutions provider.")
company2 = Company.create(name: "HealthCare Innovations", description: "Revolutionizing healthcare services.")

# Coaching Programs
coaching_program1 = CoachingProgram.create(name: "Leadership Development", duration: 6, company: company1)
coaching_program2 = CoachingProgram.create(name: "Sales Mastery", duration: 12, company: company1)
coaching_program3 = CoachingProgram.create(name: "Career Growth Accelerator", duration: 10, company: company2)
coaching_program4 = CoachingProgram.create(name: "Team Building Essentials", duration: 8, company: company2)

# Coaches
coach1 = Coach.create(email: "coach1@example.com", password: "password", password_confirmation: "password", name: "John Doe", expertise: "Leadership & Communication")
coach2 = Coach.create(email: "coach2@example.com", password: "password", password_confirmation: "password", name: "Jane Smith", expertise: "Sales Strategy")

# Assign coaches to coaching programs
coaching_program1.coaches << coach1
coaching_program2.coaches << coach1
coaching_program3.coaches << coach2
coaching_program4.coaches << coach2

# Assignments
assignment1 = Assignment.create(title: "Leadership Workshop", description: "Developing essential leadership skills.", start_date: Date.today, end_date: Date.today + 30, coaching_program: coaching_program1)
assignment2 = Assignment.create(title: "Sales Training Bootcamp", description: "Mastering the art of sales.", start_date: Date.today, end_date: Date.today + 60, coaching_program: coaching_program2)

# Employees
employee1 = Employee.create(email: "employee1@example.com", password: "password", password_confirmation: "password", name: "Alice Johnson", coaching_requirements: "Enhance leadership abilities.", address: "123 Main St, Anytown", company: company1, coaching_program: coaching_program1, coach: coach1)
employee2 = Employee.create(email: "employee2@example.com", password: "password", password_confirmation: "password", name: "Bob Smith", coaching_requirements: "Improve sales techniques.", address: "456 Elm St, Othertown", company: company2, coaching_program: coaching_program2, coach: coach2)

# Assign employees to assignments
EmployeeAssignment.create(employee: employee1, assignment: assignment1)
EmployeeAssignment.create(employee: employee1, assignment: assignment2)
EmployeeAssignment.create(employee: employee2, assignment: assignment2)

puts "Seed data has been successfully created."
