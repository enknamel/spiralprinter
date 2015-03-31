describe SpiralPrinter::Printer do
  it 'prints a 1 size graph' do
    graph = SpiralPrinter::Graph.new 1
    graph.build
    printer = SpiralPrinter::Printer.new graph
    expect(printer).to receive(:corner).once.and_call_original
    expect { printer.process }.to output("*\n\n").to_stdout
  end

  it 'prints the correct 6 size graph' do
    graph = SpiralPrinter::Graph.new 6
    graph.build
    printer = SpiralPrinter::Printer.new graph
    expect(printer).to receive(:corner).exactly(6).times.and_call_original
    expect { printer.process }.to output("*-----\n|     \n| *-* \n| * | \n|   | \n*---* \n\n").to_stdout
  end
end
