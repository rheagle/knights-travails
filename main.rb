require_relative 'lib/knight'

knight = Knight.new([3, 3], [4, 3])
path = knight.find_path

puts "You made it in #{path.length - 1} moves! Here's your path:"
path.each { |pos| puts pos.to_s }
