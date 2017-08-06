require_relative "isbn.rb"
require "csv"

def validating_isbn()
	input_file = "something.csv"
	output_result_file = "output.csv"
	file_new = File.open(output_result_file, "w")
	CSV.foreach(input_file) do |item, number|
		if item == "ITEM"
			file_new << "ITEM, NUMBER, RESULT \n"
		elsif run_program(number) == true 
		file_new << item + ", "+ number + ", valid \n"
		# file_new << "valid"
		else 
			file_new << item + ", " + number + ", invalid \n"
		end
	end
	file_new.close

end

validating_isbn()