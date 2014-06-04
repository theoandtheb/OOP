class Person
	attr_accessor :name
	def initialize
		:name
	end
	
	def hey
		p "Hi, my name is #{@name}"
	end
end



class Student < Person
	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def learn
		puts "Everything in Ruby is an Object"
	end
end

chris = Instructor.new
chris.name = "Chris"
chris.hey

christina = Student.new
christina.name = "Cristina"
christina.hey