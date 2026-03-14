require_relative 'gossip'  # On charge le model Gossip
require_relative 'view'    # On charge la view

class Controller
  def initialize
    @view = View.new  # On crée une instance de la view
  end

  # Créer un gossip
  def create_gossip
    params = @view.create_gossip  # Demande les infos à l’utilisateur
    gossip = Gossip.new(params[:author], params[:content])  # Crée un objet Gossip
    gossip.save  # Sauvegarde dans le CSV
  end

  # Afficher tous les gossips
  def index_gossips
    gossips = Gossip.all  # Récupère tous les gossips depuis le CSV
    @view.index_gossips(gossips)  # Les affiche via la view
  end

  # Supprimer un gossip
  def destroy_gossip
    index_gossips  # Affiche la liste avant suppression
    id = @view.ask_id_to_delete  # Demande quel gossip supprimer
    Gossip.destroy(id)  # Supprime le gossip choisi
  end
end
