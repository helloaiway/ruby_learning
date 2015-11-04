module Facility
    require 'Singleton'
    class Mouse
        include Singleton
        def move_to(x, y)
            p "position: #{ x }, #{ y }"
        end
        
        def click(type, times)
            case type
            when :left then left_click times
            when :right then right_click times
            else p "#{ type.to_s }"
            end
        end
        
        def left_click(times)
            p "click left #{ times } times."
        end
        
        def right_click(times)
            p "click right #{ times } times."
        end
    end
end
mouse = Facility::Mouse.instance
mouse.move_to 1, 200
mouse.click :left, 1
mouse.click :right, 2