class Rover
	attr_accessor :x, :y, :xmax, :ymax, :directn
	
	def setStart
		print " Maximum X coordinate: "
		@xmax=gets.chomp.to_i
		print " Maximum Y coordinate: "
		@ymax=gets.chomp.to_i
		print " Initial X coordinate: "
		@x=gets.chomp.to_i
		print " Initial Y coordinate: "
		@y=gets.chomp.to_i
		print " Initial direction: "
		@directn=gets.chomp
	end

	def movin
		print "So, where are we going? "
		@string = gets.chomp.to_s
		@array = @string.split(//)
		@array.each do |mve|
			if mve == "L"
				if @directn == "N"
					@directn = "W"
				elsif @directn == "W"
					@directn = "S" 
				elsif @directn == "S"
					@directn = "E"					
				elsif @directn == "E"
					@directn = "N"
				end

			elsif mve == "R"
				if @directn == "N"
					@directn = "E"
				elsif @directn == "E"
					@directn = "S" 
				elsif @directn == "S"
					@directn = "W"					
				elsif @directn == "W"
					@directn = "N"	
				end

			elsif mve == "M"	
				if @directn == "N"
					@y += 1			
				elsif @directn == "S"
					@y -= 1	
				elsif @directn == "E"
					@x += 1			
				elsif @directn == "W"
					@x -= 1	
				end

			end

			if @x.to_i > @xmax.to_i || @x.to_i < 0
				p "You've fallen off the plateau"
				break
			end

			if @y.to_i > @xmax.to_i || @y.to_i < 0
				p "You've fallen off the plateau"
				break
			end
		end
		p "#{@x} #{@y} #{@directn}"

end
end

rover = Rover.new
rover.setStart
rover.movin