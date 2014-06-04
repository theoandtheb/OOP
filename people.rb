class Person
	attr_accessor :name
	def initialize(name)
		:name = name
end

class Student
	def learn
		puts "I get it!"
	end
end

class Instructor
	def learn
		puts "Everything in Ruby is an Object"
	end
end