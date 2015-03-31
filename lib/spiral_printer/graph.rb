class SpiralPrinter
  class Graph
    attr_reader :graph
    attr_reader :size

    def initialize(size)
      @size = size
      @graph = Hash.new
      (0..size-1).each do |i|
        (0..size-1).each do |j|
          graph[[i, j]] = :space
        end
      end

      @i = size-1
      @j = size-1
      @direction = 0
    end

    def build
      #build a graph just like a turtle
      #advance and draw a character
      #spiral inwards by reducing the length of the drawn segment each turn

      ((@size - 1).downto 0).each do |i|
        fill i
        turn
      end
    end

    def fill(i)
      (0..i-1).each do |x|
        advance
      end
    end

    def turn
      @direction += 1
      @direction = 0 if @direction > 3
      draw_corner
      case @direction
        when 0
          @i -= 1
        when 1
          @j -= 1
        when 2
          @i += 1
        when 3
          @j += 1
      end
    end

    def advance
      draw_line
      case @direction
        when 0
          @i -= 1
        when 1
          @j -= 1
        when 2
          @i += 1
        when 3
          @j += 1
      end
    end

    def draw_line
      if @direction % 2 == 0
        draw :horizontal_line
      else
        draw :vertical_line
      end
    end

    def draw_corner
      draw :corner
    end

    def draw(type)
      @graph[[@i, @j]] = type
    end
  end
end
