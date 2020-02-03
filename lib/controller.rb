require 'gossip'
class ApplicationController < Sinatra::Base

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/' do
    erb :index, locals: {all_gossips: Gossip.all}
  end

  get '/gossips/:id' do
    id = params['id'].to_i
    Gossip.find(id)
    erb :show, locals: {gossip_find: Gossip.find(id), index: id}
  end
end
