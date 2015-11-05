require 'fileutils'
require 'date'
class Logfile
	
	def initialize
		@log_dir = 'logs/'
	end

	# create a file, write a word into it, read id out,
	def write filename = '0', data = ''
		file_path = get_dirs(time_to_dir)  + '/' + filename
		begin
			efile = File.open file_path,'a+'
			if efile
				efile.syswrite "#{data}\r"
				p "write successfully. File path:#{file_path}"
			else
				p 'open file failed'
			end
		rescue => e
			p e.inspect
			p 'can open the file'
		end

	end

	def time_to_dir time = nil
		begin
			time_obj = time.nil? ? DateTime.now : DateTime.parse(time)
			return "#{time_obj.year}/#{time_obj.month}/#{time_obj.day}"
		rescue => e
			p e.inspect
			p 'Can not parse time.'
			raise 'Parse error'
		end
	end

	def get_dirs dir
		begin
			path = FileUtils.mkdir_p(@log_dir + dir)
			if path
				path[0]
			end
		rescue => e
			p e.inspect
		end	
	end

	# create three directories, delete all the files in this directroy,according to the data
	def read time = '', file
		file_path = "#{@log_dir}/#{time_to_dir time}/#{file}"
		if File.readable? file_path
			efile = File.new(file_path, 'r')
			if efile
				p efile.sysread(1024)
			end
		else
			p "File #{file_path} not exist."
		end

	end

end
