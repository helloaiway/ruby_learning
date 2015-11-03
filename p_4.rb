(1..100).inject { |result, x| result * x }  
[1, ['2', [3, [4, ['5']]]]].flatten.select { |x| x.class == Fixnum }
[1, ['2', [3, [4, ['5']]]]].flatten.select { |x| x.respond_to?(:abs) }