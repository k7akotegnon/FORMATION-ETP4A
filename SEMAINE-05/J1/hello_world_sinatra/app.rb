# =============================================
# S5J1 - Mon application Sinatra
# =============================================
require 'sinatra'

# =============================================
# ROUTES (URLs de l'application)
# =============================================

get '/' do
  @titre = "Accueil"
  @message = "Bienvenue sur mon blog Sinatra - S5J1 ! 🚀"
  erb :index
end

get '/about' do
  @titre = "À propos"
  erb :about
end

get '/contact' do
  @titre = "Contact"
  erb :contact
end

get '/ressources' do
  @titre = "Ressources"
  erb :ressources
end

# Gestion du formulaire de contact (POST)
post '/contact' do
  nom = params[:nom]
  message = params[:message]
  puts "📧 Message reçu de #{nom} : #{message}"   # visible dans le terminal
  "Merci #{nom} ! Ton message a bien été reçu."
end

# Configuration du port
set :port, 4567