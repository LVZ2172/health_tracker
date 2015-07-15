require 'rails_helper'

describe Exercise do
  it {should validate_presence_of :name}
  it {should validate_presence_of :calories}
end
