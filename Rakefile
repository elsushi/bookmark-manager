require 'data_mapper'
require './app/server'

task :auto_upgrade do 
	DataMapper.auto_upgrade!
	puts "Auto-upgrade complete (no data loss)"
end

task :auto_migrate do 
	DataMapper.auto_migrate!
	puts "Auto_migrate complete (data was lost)"
end

