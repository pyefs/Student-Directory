old_sync = $stdout.sync
$stdout.sync = true
require './lib/hash_and_array.rb'

describe "array_i" do
	array = [ 2, 3, 1, 4, 5, 0 ]
	subject { array_i(array) }
	it 'sorts by value' do
		expect(subject).to eq([0, 1, 2, 3, 4, 5])
	end
end

describe "array_to_words" do
	array_u = [{name: 'Amin', age: 43}, {name: 'Pye', age: 30}, {name: 'Bud', age:35}]
	subject { array_to_words(array_u) }
	it 'return argument in a sentence' do
		expect(subject).to eq(["Amin is 43 years old", "Pye is 30 years old", "Bud is 35 years old"])
	end
end

describe "brands" do
	players = [{ name: 'Zlatan', brand: 'Nike'}, { name: 'Walcott', brand: 'ADIDAS'},
           { name: 'Roberts', brand: 'nike'}, { name: 'Hamilton', brand: 'puma'},
           { name: 'Rossi', brand: 'adidas'}, { name: 'Muller', brand: 'nike'},
           { name: 'Schwans', brand: 'PUMA'}, { name: 'Miller', brand: 'UMBRO'}]
    subject { brands(players) }
    it 'accepts players with ADIDAS and Nike brands only' do
    	expect(subject).to eq(
    		{
    			nike: ['Zlatan', 'Roberts', 'Muller'],
    			adidas: ['Walcott', 'Rossi']    		
    		}
    	)
    end
end