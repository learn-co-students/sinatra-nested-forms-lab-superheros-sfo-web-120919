require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do 
        erb :super_hero
    end

    post '/teams' do
        @team_name = params[:team][:name]
        @team_motto = params[:team][:motto]
        @team_members = params[:team][:members]
        @hero_name = []
        @hero_power = []
        @hero_bio = []
        @team_members.each do |member|
            @hero_name << member[:name]
            # binding.pry
            @hero_power << member[:power]
            # binding.pry
            @hero_bio << member[:bio]
            # binding.pry
        end

    erb :team
    # binding.pry
    end

end
