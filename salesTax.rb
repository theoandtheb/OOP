$textArray = Array.new
$taxSub = String.new.to_f
$total = String.new.to_f

class Item
	attr_accessor :quantity, :type, :price
	def initialize(quantity,price,type)
		@quantity = quantity
		@type = type
		@price = price
	end

	def exempt
		priceByQuantity = quantity*price
		$textArray << "#{quantity.to_i} #{type}: #{sprintf "%.2f", priceByQuantity}"
		$total += priceByQuantity
	end

	def tax
		textWithTax = quantity*price*1.1
		$taxSub += quantity*price*0.1
		$total += quantity*price
		$textArray << "#{quantity.to_i} #{type}: #{sprintf "%.2f", textWithTax}"
	end

	def exemptDuty
		textWithTax = quantity*price*1.05
		$taxSub += quantity*price*0.05
		$total += quantity*price
		$textArray << "#{quantity.to_i} #{type}: #{sprintf "%.2f", textWithTax}"
	end

	def taxDuty
		textWithTax = quantity*price*1.15
		$taxSub += quantity*price*0.15
		$total += quantity*price
		$textArray << "#{quantity.to_i} #{type}: #{sprintf "%.2f", textWithTax}"
	end

end

print "Please enter provide me with the number of unique items you wish to purchase, followed by a description of the item and the price at which you wish to charge.\n\nShoud you have no other items to add to this purchase, simply press entered when prompted for another item."
sleep 2.8
count = 1
k = 0
until k == ""
	flag = 0
	print "\n\nPlease enter item \##{count}:  "
	k = gets.chomp
	count += 1
	if k == ""
		break
	end
	arr = k.split(" ").delete_if {|n| n == "at"}
	if arr.any? { |x| ["book", "chocolate", "chocolates", "pills"].include?(x) } && 
		if arr.include?("imported")
			flag = 3
		else
			flag = 1
		end
	elsif arr.include?("imported")
		flag = 4
	else
		flag = 2
	end

	work=Item.new(arr.slice!(0).to_f,arr.pop.to_f,arr.join(" "))
	if flag == 1
		work.exempt
	elsif flag ==2
		work.tax
	elsif flag == 3
		work.exemptDuty
	elsif flag == 4
		work.taxDuty
	end

end


derp = $taxSub.round(2).to_s.split("")
if derp[-1].to_i.between?(1,4)
	derp[-1]=5
	$taxRound = derp.join("").to_f
elsif derp[-1].to_i.between?(6,9)
	derp[-1]=0
	$taxRound = (derp.join("").to_f) + 0.1
else
	$taxRound = derp.join("").to_f
end

finalTotal = $total+$taxRound

puts $textArray
print "Sales Taxes and Import Duties: #{sprintf "%.2f", $taxRound.round(2)}"
print "\nTotal: #{sprintf "%.2f", finalTotal}\n\n"

# Starting with:  {quantity} {type} <at> {price}   work=Item.new(arr.slice!(0),arr.pop.to_f,arr.join(" "))
#Looking for: exempt items arr.any? { |x| ["book", "chocolate", "chocolates", "pills"].include?(x) }
#			: imported arr.include?("imported")
# The taxes and total must be added as a total at the end
# When taxes are applied, the price must relect the price with taxes
#      The quantity, description and modified price must be exported to an array for printing $itemsArray << "#{quantity} #{type}: #{$taxPlace}"
# 