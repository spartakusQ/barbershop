require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'



set :database, "sqlite3:/home/qq/myapp/barbershop/db/barbershop.db"

class Client < ActiveRecord::Base
  validates :name, presence: true
  validates :phone, presence: true
  validates :datestamp, presence: true
  validates :color, presence: true
end

class Barber < ActiveRecord::Base
end

before do
	@barbers = Barber.all
	erb :index
end

get '/' do
		erb :index
end

get '/visit' do
	@c = Client.new
	erb :visit
end

post '/visit' do
	@c= Client.new params[:client]
	if @c.save
	  erb "<h2>Спасибо что записались</h2>"
	else
		@error = @c.errors.full_messages.first
		erb :visit
	end
end

get '/barber/:id' do
	@barber = Barber.find(params[:id])
	erb :barber
end
