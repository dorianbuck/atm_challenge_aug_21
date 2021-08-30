require_relative '../src/atm.rb'

describe Atm do
  it 'is expected to have 1000 on initialize' do
    expect(subject.funds).to eq 1000
  end
end
