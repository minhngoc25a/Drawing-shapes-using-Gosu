require 'rubygems'
require 'gosu'
require './circle'

module ZOrder
  BACKGROUND, MIDDLE, TOP = *0..2
end

class DemoWindow < Gosu::Window 
    def initialize
        super(640, 400, false)
    end

    def draw
        # The background
        Gosu.draw_rect(0, 0, 640, 400, 0xff_6DD3FF, ZOrder::BACKGROUND)
        # The house
        Gosu.draw_rect(300, 150, 150, 150, 0xff_F0DCDC, ZOrder::MIDDLE)
        # Draw the roof with a isosceles triangle
        # Triangle first vertex = House rectangle top left corner
        # Triangle second vertex = Top left corner coordinate + width of house
        # Triangle third vertex = Top right corder coordinate in the case the house was draw in the same manner using draw_quad()
        draw_triangle(300, 150, Gosu::Color::RED, 375, 75, Gosu::Color::RED, 450, 150, Gosu::Color::RED, ZOrder::TOP)
        # Draw the door
        Gosu.draw_rect(350, 225, 50, 75, 0xff_873232, ZOrder::TOP)
        # Draw the door knob
        knob = Gosu::Image.new(Circle.new(10))
        knob.draw(375, 250, ZOrder::TOP, 1.0, 1.0, 0xff_F1F90B)
    end
end

DemoWindow.new.show