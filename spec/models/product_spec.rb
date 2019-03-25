require 'rails_helper'

RSpec.describe 'Product', :type => :model do
  before(:all) do
    @product = create(:product)
  end

  it 'is valid with valid attributes' do
    expect(@product).to be_valid
  end

  it 'is invalid without name attribute' do
    product = build(:product, name: '')
    expect(product).to_not be_valid
  end

  it 'is invalid when such name is exist' do
    product2 = @product.dup
    expect(product2).to_not be_valid
  end

  it 'is invalid without category attribute' do
    product = build(:product, category: '')
    expect(product).not_to be_valid
  end

  it 'is invalid without price attribute' do
    product = build(:product, price: '')
    expect(product).not_to be_valid
  end
end
