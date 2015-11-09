require 'fileutils'
require 'date'

PermissionError = Class.new(IOError)


class Logfile
	
	def initialize
		@log_dir = 'logs/'
	end

	# create a file, write a word into it, read id out,
	def write(data = '', filename = '0')	
		file_path = get_dirs(time_to_dir)  + '/' + filename
		efile = File.open file_path,'a+'
		if efile
			efile.syswrite "#{data}\r"
			p "write successfully. File path:#{file_path}"
		else
			p 'Open file failed.'
		end
	rescue PermissionError
		p "Permission limited. Can not create directory in #{@log_dir}"
	rescue => e
		p e.inspect
		p 'Failed! Unable to open the file.'

	end

	def time_to_dir(time = nil)
		time_obj = time.nil? ? DateTime.now : DateTime.parse(time)
		return time_obj.strftime('%Y/%m/%d') #{}"#{time_obj.year}/#{time_obj.month}/#{time_obj.day}"
	rescue => e
		p e.inspect
		raise ArgumentError
	end

	def get_dirs(dir)
		path = FileUtils.mkdir_p(@log_dir + dir)
		if path
			path[0]
		end
	rescue => e
		p e.inspect
		raise PermissionError
	end

	# create three directories, delete all the files in this directroy,according to the data
	def read(file, time = nil)
		file_path = "#{@log_dir}" + time_to_dir(time) + "/#{file}"
		if File.readable? file_path
			efile = File.new(file_path, 'r')
			if efile
				p efile.sysread(1024)
			end
		else
			p "File #{file_path} not exist."
		end
	rescue ArgumentError
		p "The second paramter is not a correct time format."
	rescue => e
		p e.message
	ensure
		p "Paramters example: file:'test', time:'2015-11-4"	

	end

end

logger = Logfile.new
#logger.write Time.now.to_s
#logger.read '0', DateTime.now.strftime('%Y-%m-%d')
