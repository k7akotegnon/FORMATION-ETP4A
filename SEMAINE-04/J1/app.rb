require_relative 'lib/user'
require_relative 'lib/event'
require_relative 'lib/event_creator'
require_relative 'lib/calendar_displayer'
require_relative 'lib/date_parser'

# Création d’utilisateurs
julie = User.new("julie@email.com", 32)
jean  = User.new("jean@email.com", 25)

# Création d’événements
event1 = Event.new("2026-03-09 09:00", 60, "Réunion projet", [julie.email, jean.email])
event2 = Event.new("2026-03-10 14:00", 30, "Brainstorming", [julie.email])

# Création interactive
creator = EventCreator.new
my_event = creator.event

# Affichage calendrier ASCII
calendar = CalendarDisplayer.new([event1, event2, my_event])
calendar.display(3, 2026)

# Exemple avec DateParser
#parsed_date = DateParser.parse("le 14 octobre à 15 h")
#if parsed_date
 # event3 = Event.new(parsed_date.to_s, 45, "RDV client", ["julie@email.com"])
  #event3.to_s
#end
