require 'oystercard'

describe Oystercard do

  it 'checks the tests infraestructure' do
    expect(subject.check_tests).to eq("Test Infraestructure working")
  end

  it 'checks the tests infraestructure' do
    expect(subject.check_tests).to_not eq("est Infraestructure working")
  end

end
