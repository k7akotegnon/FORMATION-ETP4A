# Définition de la classe User
class User
  # Création d'accesseurs pour email et age
  # Cela permet de lire et modifier ces attributs depuis l'extérieur de la classe
  attr_accessor :email, :age

  # Variable de classe (commune à tous les objets User)
  # Elle sert à stocker la liste de tous les utilisateurs créés
  @@all_users = []

  # Méthode d'initialisation appelée lors de la création d'un nouvel utilisateur
  def initialize(email, age)
    @email = email   # Attribut d'instance : email de l'utilisateur
    @age = age       # Attribut d'instance : âge de l'utilisateur

    # Chaque nouvel utilisateur est ajouté automatiquement à la liste @@all_users
    @@all_users << self
  end

  # Méthode de classe (self fait référence à la classe User)
  # Retourne la liste de tous les utilisateurs créés
  def self.all
    @@all_users
  end

  # Recherche un utilisateur par email
  def self.find_by_email(email)
    @@all_users.find { |user| user.email == email }
  end
end
