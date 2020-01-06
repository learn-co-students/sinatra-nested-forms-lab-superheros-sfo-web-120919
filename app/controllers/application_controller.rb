require 'sinatra/base'
require 'pry'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do 
      erb :super_hero
    end 

    post '/teams' do 
      
      @team = Team.new(params["team"]["name"], params["team"]["motto"])
      #binding.pry
      @heroes = params["team"]["heros"].map do |hero_info|
          SuperHero.new(hero_info["name"], hero_info["power"], hero_info["bio"])
      end
      
      #binding.pry
      erb :team 
    end 


end
