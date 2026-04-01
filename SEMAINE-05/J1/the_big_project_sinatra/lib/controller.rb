require 'sinatra/base'
require_relative 'gossip'

class ApplicationController < Sinatra::Base
  # 👉 Configuration pour servir les fichiers statiques (CSS, images, JS)
  set :public_folder, File.expand_path("../public", __dir__)

  # Page d’accueil
  get '/' do
    @gossips = Gossip.all
    erb :index
  end

  # Formulaire de création
  get '/gossips/new/' do
    erb :new_gossip
  end

  # Enregistrement d’un nouveau gossip
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  # Affichage d’un gossip spécifique
  get '/gossips/:id/' do
    id = params['id'].to_i
    @gossip = Gossip.all[id - 1]
    @id = id
    erb :show
  end

  # Suppression
  post '/gossips/:id/delete' do
    Gossip.delete(params['id'].to_i)
    redirect '/'
  end

  # Formulaire de modification
  get '/gossips/:id/edit/' do
    id = params['id'].to_i
    @gossip = Gossip.all[id - 1]
    @id = id
    erb :edit_gossip
  end

  # Mise à jour
  post '/gossips/:id/update' do
    Gossip.update(params['id'].to_i, params["gossip_author"], params["gossip_content"])
    redirect '/'
  end
end
