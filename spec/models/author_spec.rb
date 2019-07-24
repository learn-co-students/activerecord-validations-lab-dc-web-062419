# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author, type: :model do
  it 'is valid' do
    author = Author.new(name: 'Caligula', phone_number: 5_553_054_425)
    expect(author).to be_valid
  end

  it 'is invalid with no name' do
    author = Author.new(phone_number: 5_553_054_425)
    expect(author).to be_invalid
  end

  it 'is invalid with a short number' do
    author = Author.new(name: 'Caligula', phone_number: 555_305_442)
    expect(author).to be_invalid
  end

  it 'is invalid when non-unique' do
    Author.create(name: 'Caligula', phone_number: 5_553_054_425)
    author = Author.new(name: 'Caligula', phone_number: 5_557_890_001)
    expect(author).to be_invalid
  end
end
