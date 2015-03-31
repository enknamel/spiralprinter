describe SpiralPrinter do
  it 'requires exactly 1 argument' do
    allow_any_instance_of(SpiralPrinter::Printer).to receive(:process)
    expect { SpiralPrinter.new([]).print }.to raise_error
    expect { SpiralPrinter.new(["1"]).print }.not_to raise_error
    expect { SpiralPrinter.new([1, 2]).print }.to raise_error
  end

  it 'requires the 1 argument to between 1 and 100' do
    allow_any_instance_of(SpiralPrinter::Printer).to receive(:process)
    expect { SpiralPrinter.new([1]).print }.not_to raise_error
    expect { SpiralPrinter.new([-11]).print }.to raise_error
    expect { SpiralPrinter.new([101]).print }.to raise_error
  end
end

