require_relative '../src/account.rb'
require 'date'

describe Account do
  let(:person) {instance_double('person', name: 'Johnny')}
  subject {described_class.new({owner: person})}

  it 'is expected to have a 4 digit pincode' do
    pin_length = Math.log10(subject.pin_code).to_i + 1
    expect(pin_length).to eq 4
  end

  it 'is expected to have an owner' do
    expect(subject.owner).to eq person
  end
end