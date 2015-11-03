# example 1:
a = Proc.new do |x, y|
			x + y**2
		end
#example 2:
b = lambda { |x, y| x + y**2 }

#example 3"
c = proc { |x, y| x + y**2 }

p a.call(2, 4)
p b.call(2, 4)
p c.call(2, 4)