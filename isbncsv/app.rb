require "sinatra"
require_relative "isbn.rb"

get '/' do
	redirect '/get_match_string'
end

get '/get_match_string' do
	erb :get_isbn
end

post '/validate_match_string' do
 	match_string = params[:match_string]
 	results = run_program(match_string).to_s
 	"results = #{results}"
 	redirect '/get_results?match_string=' + match_string + '&results=' + results 
# 	orderdate = params[:orderdate].gsub(' ', '-')
# 	redirect '/fries?sandwich=' + sandwich + '&orderdate=' + orderdate
end

 get '/get_results' do
 	match_string = params[:match_string]
 	results = params[:results]
 	erb :results, :locals => {:match_string => match_string, :results => results}
end

# post '/fries_choice' do
# 	sandwich = params[:sandwich]
# 	fries = params[:fries].gsub(' ', '-')
# 	orderdate = params[:orderdate]
# 	if fries == "yes"
# 		side = "fries"
# 		redirect '/shake?sandwich=' + sandwich + '&side=' + side + '&orderdate=' + orderdate
# 	else
# 		erb :side, :locals => {:sandwich => sandwich, :orderdate => orderdate}
# 	end
# end