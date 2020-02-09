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

  #voir repo jade caillot on peut aussi utiliser params en dessous
  get '/gossips/:id' do
    id = params['id'].to_i
    Gossip.find(id)
    erb :show, locals: {gossip_find: Gossip.find(id), index: id}
  end

  get '/gossips/:id/edit/' do
    id = params['id'].to_i
    erb :edit, locals: {gossip: Gossip.find(id), id: id}
  end

  post '/gossips/:id/edit/' do
    id = params['id'].to_i
    g_to_update = Gossip.find(id)
    g_to_update.update(id,params["gossip_author"], params["gossip_content"]).
    redirect '/gossips/'
  end
end

