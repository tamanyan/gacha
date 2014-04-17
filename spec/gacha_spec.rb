require 'spec_helper'
require 'gacha/box'
require 'gacha/item'

describe Gacha do
  let :box do
    Gacha::Box.new
  end

  it "should add item" do
    box.add(Gacha::Item.new("test", 30))
    expect(box.count).to eq(1)
  end

  it "should pick up item" do
    item = Gacha::Item.new("test1", 30)
    box.add(item)
    expect(box.draw).to eq(item)
  end

  it "should add items" do
    items = [
      Gacha::Item.new("test1", 30),
      Gacha::Item.new("test2", 30),
      Gacha::Item.new("test3", 30),
      Gacha::Item.new("test4", 30),
      Gacha::Item.new("test5", 30),
    ]
    items.each do |item|
      box.add(item)
    end
    expect(box.count).to eq(5)
  end

  it "should remove item" do
    item = Gacha::Item.new("test1", 30)
    box.remove(item)
    expect(box.count).to eq(0)
    expect(box.empty?).to be_true
  end

  it "should be consumable" do
    box.set_consumable(true)
    item = Gacha::Item.new("test1", 30)
    box.add(item)
    expect(box.draw).to eq(item)
    expect(box.empty?).to be_true

    item = Gacha::Item.new("test2", 30)
    box.add(item)
    expect(box.draw).to eq(item)
    expect(box.draw).to be_nil
  end
end
