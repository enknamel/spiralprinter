Dir[File.join(File.dirname(__FILE__), 'spiral_printer', '*.rb')].each do |f|
  require f
end

class SpiralPrinter

  def initialize(argv)
    @argv = argv
  end

  def print
    if @argv.length != 1
      fail 'This command accepts exactly 1 argument: the size of spiral to print'
    end

    spiral_size = @argv[0].to_i

    if spiral_size < 0 || spiral_size > 100
      fail 'The size of spirals to print must be between 1 and 100 inclusive'
    end

    graph = Graph.new spiral_size
    graph.build
    printer = Printer.new graph
    printer.print
  end
end