require_relative "room"

class Hotel
    def initialize(name, hash)
        @name = name

        @rooms = {}

        hash.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end

    def name
        @name.split.map {|words| words.capitalize}.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(person, room_name)
        if room_exists?(room_name)
            success = @rooms[room_name].add_occupant(person)
            if success 
                p 'check in successful'
            else
                p 'sorry, room is full'
            end
        else
            p 'sorry, room does not exist'
        end
    end

    def has_vacancy?
        @rooms.values.any? {|room| !room.full?}
    end

    def list_rooms
        @rooms.each {|room_name, capacity| puts "#{room_name}: #{capacity.available_space}"}
    end
  
end
