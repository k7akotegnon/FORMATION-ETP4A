# config.ru - S5J1 The Gossip Project
require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'controller'

run ApplicationController