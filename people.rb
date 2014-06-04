class Person
	attr_accessor :name
	def initialize
		:name
	end
	
	def hey
		p "Hi, my name is #{@name}"
	end
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

chris = Person.new
chris.name = "Chris"
chris.hey