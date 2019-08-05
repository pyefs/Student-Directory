old_sync = $stdout.sync
$stdout.sync = true

def array_i(array)
	array.sort
end

def array_to_words(array_u)
	array_x = []
	array_u.each do |i|	
		array_x << "#{i[:name]} is #{i[:age]} years old"
	end
	array_x
end

players = [{ name: 'Zlatan', brand: 'Nike'}, { name: 'Walcott', brand: 'ADIDAS'},
           { name: 'Roberts', brand: 'nike'}, { name: 'Hamilton', brand: 'puma'},
           { name: 'Rossi', brand: 'adidas'}, { name: 'Muller', brand: 'nike'},
           { name: 'Schwans', brand: 'PUMA'}, { name: 'Miller', brand: 'UMBRO'}]

def brands(players)
	adidas = []
	nike = []
	players.each do |i|
		if i[:brand].downcase == "nike"
			nike << i[:name]
		elsif i[:brand].downcase == "adidas"
			adidas << i[:name]
		end
	end
	{
		nike: nike,
		adidas: adidas
	}
end
