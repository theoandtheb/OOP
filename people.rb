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
		p "I get it!"
	end
end

class Instructor < Person
	def teach
		p "Everything in Ruby is an Object"
	end
end

chris = Instructor.new
chris.name = "Chris"
chris.hey
chris.teach

christina = Student.new
christina.name = "Cristina"
christina.hey
christina.learn