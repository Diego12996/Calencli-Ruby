require "date"
require "colorize"
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
    "calendar" => "web-dev" }
]
# Methods
def tittle_menu
  puts "\n"
  print "-" * 30
  print "Welcome to CalenCLI"
  print "-" * 29
  puts "-"
  puts "\n" * 2
end

def actions_menu
  puts "\n"
  puts "-" * 60
  puts "list | create | show | update | delete | next | prev | exit"
  puts "\n"
end

def list_events(list)
  list.each do |value|
    s_date = DateTime.parse(value["start_date"])
    print s_date.strftime("%a %b %d")
    if value["end_date"].length.zero?
      print " " * 20
    else
      e_date = DateTime.parse(value["end_date"])
      print " " * 5
      print s_date.strftime("%H:%M")
      print e_date.strftime(" - %H:%M")
      print " " * 2
    end
    if value["calendar"] == "tech"
      puts "#{value['title'].colorize(:light_red)} (#{value['id']})"
    elsif value["calendar"] == "english"
      puts "#{value['title'].colorize(:light_magenta)} (#{value['id']})"
    elsif value["calendar"] == "soft-skills"
      puts "#{value['title'].colorize(:green)} (#{value['id']})"
    elsif value["calendar"] == "web-dev"
      puts "#{value['title'].colorize(:light_blue)} (#{value['id']})"
    else
      puts "#{value['title']} (#{value['id']})"
    end
    puts "\n"
  end
end

def ver_id(event)
  verify = false
  while verify == false
    print "Event ID: "
    $i_d = gets.chomp.to_i
    verify = event.find { |value| value["id"] == $i_d }
    if verify.nil?
      puts "Event doesn't exist"
      verify = false
    else
      verify = true
    end
  end
end

def ver_date
  verify = false
  while verify == false
    print "date: "
    $date = gets.chomp
    if $date == "\n"
      verify = false
      puts "Type a valid date: YYYY-MM-DD"
    else
      dates_d = $date.split("-")
      $dates = dates_d
      count = 0
      if dates_d[0].length != 4
        count += 1
      elsif dates_d[1].length != 2 || dates_d[2].length != 2
        count += 1
      end
      if count > 0
        verify = false
        puts "Type a valid date: YYYY-MM-DD"
      elsif Date.valid_date?(dates_d[0].to_i, dates_d[1].to_i, dates_d[2].to_i) == true
        verify = true
      else
        puts "Type a valid date: YYYY-MM-DD"
        verify = false
      end
    end
  end
end

def ver_title(event, id)
  verify = false
  while verify == false
    print "tittle: "
    $title = gets
    if $title == "\n"
      puts "Cannot be blank"
      verify = false
    else
      $title = $title.chomp
      event[id]["title"] = $title
      verify = true
    end
  end
end

def up_calen(event, id)
  print "calendar: "
  $calendar = gets
  if $calendar == "\n"
    event[id]["calendar"] = "default"
  else
    $calendar = $calendar.chomp
    event[id]["calendar"] = $calendar
  end
end

def up_date(event, id)
  verify = false
  while verify == false
    print "start_end: "
    $start_end = gets
    if $start_end == "\n"
      $start_date = DateTime.new($dates[0].to_i, $dates[1].to_i, $dates[2].to_i, 0, 0, 0, "-05:00")
      $start_date = $start_date.to_s
      end_date = ""
      event[id]["start_date"] = $start_date
      event[id]["end_date"] = end_date
      verify = true
    else
      $start_end = $start_end.chomp
      if $start_end.length == 11
        comp = $start_end.split
        h1 = comp[0].split(":")
        h2 = comp[1].split(":")
        a = h1[0].to_i * 10
        b = h1[1].to_i / 10
        c = h2[0].to_i * 10
        d = h2[1].to_i / 10
        h_a = a + b
        h_b = c + d
        if h_b < h_a
          puts "Cannot end before start"
          verify = false
        else
          start_date = DateTime.new($dates[0].to_i, $dates[1].to_i, $dates[2].to_i, h1[0].to_i, h1[1].to_i, 0, "-05:00")
          start_date = start_date.to_s
          end_date = DateTime.new($dates[0].to_i, $dates[1].to_i, $dates[2].to_i, h2[0].to_i, h2[1].to_i, 0, "-05:00")
          end_date = end_date.to_s
          event[id]["start_date"] = start_date
          event[id]["end_date"] = end_date
          verify = true
        end
      else
        puts "Format: 'HH:MM HH:MM' or leave it empty"
        verify = false
      end
    end
  end
end

def notes(event, id)
  print "notes: "
  $note = gets
  if $note == "\n"
    event[id]["notes"] = ""
  else
    $note = $note.chomp
    event[id]["notes"] = $note
  end
end

def guests(event, id)
  print "guests: "
  guests_g = gets
  $guests = guests_g
  if guests_g == "\n"
    event[id]["guests"] = []
  else
    guests_g = guests_g.chomp
    guests_g = guests_g.split(", ")
    event[id]["guests"] = guests_g
  end
end

def dele_reset_id(event)
  event.delete_at $i_d - 1
  id = 1
  event.each do |value|
    value["id"] = id
    id = id.next
  end
end

def creat_hash(event)
  id = event.length + 1
  new_c = {
    "id" => id,
    "start_date" => "",
    "title" => "",
    "end_date" => "",
    "notes" => "",
    "guests" => "",
    "calendar" => ""
  }
  event.push(new_c)
end

def show(events)
  verify = false
  while verify == false
    print "Event ID: "
    id = gets.chomp.to_i
    verify = events.find { |value| value["id"] == id }
    if verify.nil?
      puts "Event doesn't exist"
      verify = false
    else
      verify = true
    end
  end
  found_event = events.find { |event| event["id"] == id }
  if found_event["start_date"].empty? == false && found_event["end_date"].empty? == false
    inicio = DateTime.parse(found_event["start_date"])
    fin = DateTime.parse(found_event["end_date"])
    print "date: #{inicio.strftime('%F')}"
    puts ""
    print "title: #{found_event['title']}"
    puts ""
  
    if found_event["calendar"] == "default"
      print ""
    else
      print "calendar: #{found_event['calendar']}"
      puts ""
    end
  
    print "start_end: #{inicio.strftime('%H:%M')} #{fin.strftime('%H:%M')}"
    puts ""
  
  elsif found_event["start_date"].empty? != true && found_event["end_date"].empty? != false
    inicio = DateTime.parse(found_event["start_date"])
    print "date: #{inicio.strftime('%F')}"
    puts ""
    print "title: #{found_event['title']}"
    puts ""
  
    if found_event["calendar"] == "default"
      print ""
    else
      print "calendar: #{found_event['calendar']}"
      puts ""
    end
      print "start_end: #{inicio.strftime('%H:%M')}"
      puts ""
  else
    print ""
  end
  
  if found_event["notes"].empty? == false
    print "notes: #{found_event['notes']}"
    puts ""
  else
    print ""
  end
  
  if found_event["guests"].empty? == false   #--------------------> Recorro el arreglo del guests
    print "guests: "
    for i in 0...found_event["guests"].length do
      if i == found_event["guests"].length - 1
        print "#{found_event['guests'][i]} "
      else
        print "#{found_event['guests'][i]}, "
      end
    end
  else
    print ""
  end
end
# Main Program
tittle_menu
list_events(events)
i = false
while i == false
  actions_menu
  print "action: "
  action = gets.chomp
  case action
  when "list"
    tittle_menu
    list_events(events)
  when "create"
    creat_hash(events)
    ver_date
    id = events.length - 1
    ver_title(events, id)
    up_calen(events, id)
    up_date(events, id)
    notes(events, id)
    guests(events, id)
  when "show"
    show(events)
  when "update"
    ver_id(events)
    ver_date
    id = $i_d - 1
    ver_title(events, id)
    up_calen(events, id)
    up_date(events, id)
    notes(events, id)
    guests(events, id)
    actions_menu
    puts "action: show"
    show(events, $i_d)
  when "delete"
    ver_id(events)
    dele_reset_id(events)
    actions_menu
    puts "action: list"
    tittle_menu
    list_events(events)
  when "next"
    puts "estas en next"
  when "prev"
    puts "estas en prev"
  when "exit"
    puts "Thanks for using calenCLI"
    i = true
  end
end
