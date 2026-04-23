# lib/controller.rb - ApplicationController
require 'gossip'

class ApplicationController < Sinatra::Base
  # Page d'accueil : affiche la liste des potins [17]
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  # Page du formulaire de création [15]
  get '/gossips/new/' do
    erb :new_gossip
  end

  # Traitement du formulaire et redirection [18, 19]
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  # Page d'affichage d'un potin spécifique (Route dynamique) [13, 20]
  get '/gossips/:id/' do
    erb :show, locals: {gossip: Gossip.find(params['id']), id: params['id']}
  end
end