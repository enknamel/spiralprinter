class SpiralPrinter
  class Printer
    def initialize(graph)
      @graph = graph
    end

    def process
      (@graph.size - 1).downto(0).each do |y|
        0.upto(@graph.size-1).each do |x|
          #puts "#{x} #{y}"
          self.send @graph.graph[[x, y]]
        end
        nl
      end
      nl
    end

    def corner
      print '*'
    end

    def horizontal_line
      print '-'
    end

    def vertical_line
      print '|'
    end

    def nl
      print "\n"
    end

    def space
      print ' '
    end
  end
end
