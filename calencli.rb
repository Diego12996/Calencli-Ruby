require 'date'
# Data
id = 0
events = [
  { "id" => (id = id.next),
    "start_date" => "2021-11-15T00:00:00-05:00",
    "title" => "Ruby Basics 1",
    "end_date" => "",
    "notes" => "Ruby Basics 1 notes",
    "guests" => %w[Teddy Codeka],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-15T12:00:00-05:00",
    "title" => "English Course",
    "end_date" => "2021-11-15T13:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-16T00:00:00-05:00",
    "title" => "Ruby Basics 2",
    "end_date" => "",
    "notes" => "Ruby Basics 2 notes",
    "guests" => %w[Andre Codeka],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-16T12:45:00-05:00",
    "title" => "Soft Skills - Mindsets",
    "end_date" => "2021-11-15T13:30:00-05:00",
    "notes" => "Some extra notes",
    "guests" => ["Diego"],
    "calendar" => "soft-skills" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-17T00:00:00-05:00",
    "title" => "Ruby Methods",
    "end_date" => "",
    "notes" => "Ruby Methods notes",
    "guests" => %w[Diego Andre Teddy Codeka],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-17T12:00:00-05:00",
    "title" => "English Course",
    "end_date" => "2021-11-15T13:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-18T09:00:00-05:00",
    "title" => "Summary Workshop",
    "end_date" => "2021-11-19T13:30:00-05:00",
    "notes" => "A lot of notes",
    "guests" => %w[Diego Teddy Andre Codeka],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-18T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-19T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-19T12:00:00-05:00",
    "title" => "English for Engineers",
    "end_date" => "2021-11-19T13:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-20T10:00:00-05:00",
    "title" => "Breakfast with my family",
    "end_date" => "2021-11-20T11:00:00-05:00",
    "notes" => "",
    "guests" => [],
    "calendar" => "default" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-20T15:00:00-05:00",
    "title" => "Study",
    "end_date" => "2021-11-20T20:00:00-05:00",
    "notes" => "",
    "guests" => [],
    "calendar" => "default" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-25T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-26T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
]
# Methods
def tittle_menu()
  print "-" * 30
  print "Welcome to CalenCLI"
  print "-" * 29
  puts "-"
  puts "\n" * 2
end
def actions_menu()
  puts "\n"
  puts "-" * 60
  puts "list | create | show | update | delete | next | prev | exit"
end
def list_events(list)
  list.each do |value|
    s_date = DateTime.parse(value["start_date"])
    print s_date.strftime("%a %b %d")
    if value["end_date"].length == 0
      print " " * 20
    else
      e_date = DateTime.parse(value["end_date"])
      print " " * 5
      print s_date.strftime("%H:%M")
      print e_date.strftime(" - %H:%M")
      print " " * 2
    end
    puts "#{value["title"]} (#{value["id"]})"
    puts "\n"
  end
end
# Main Program
tittle_menu()
list_events(events)

i = false
while i == false
  actions_menu()
  print "action: "
  action = gets.chomp
  case action
  when "list"
    puts "estas en print"
  when "create"
    puts "estas en create"
  when "show"
    puts "estas en show"
  when "update"
    puts "estas en update"
  when "delete"
    puts "estas en delete"
  when "next"
    puts "estas en next"
  when "prev"
    puts "estas en prev"
  when "exit"
    puts "Thanks for using calenCLI"
    i = true
  end
end
