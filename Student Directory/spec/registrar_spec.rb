old_sync = $stdout.sync
$stdout.sync = true
require './lib/student_registration.rb'

describe "registration" do
	describe "announcement" do
		subject { announcement }
		it 'puts a message' do
			expect{subject}.to output("Wecome to Student Registration Directory\n").to_stdout
		end
	end
	describe "sudent_name" do
		subject { student_name }
		it do
			expect(subject).to eq("pye fs")
		end	
	end
	describe "student_age" do
		subject { student_age }
		it do
			expect(subject).to eq(30)
		end
	end
end