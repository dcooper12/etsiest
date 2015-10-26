require "etsiest/version"
require "sinatra/base"
require "pry"
require "etsy"


Etsy.api_key = ENV['ETSY_KEY']

module Etsiest
  class App < Sinatra::Base
  	set :logging, true

  	get "/" do
  		query = "whiskey"
		  response = Etsy::Request.get('/listings/active', :includes => ['Images', 'Shop'], :keywords => query)
		  items = response.result
		  erb :index, locals: { items: items }
	  end

  	run! if app_file == $0
  end
end
