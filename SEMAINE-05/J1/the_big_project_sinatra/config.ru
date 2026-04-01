# config.ru
require 'bundler'
Bundler.require

# On charge directement le fichier controller.rb depuis lib/
require_relative 'lib/controller'

# On lance l'application
run ApplicationController
