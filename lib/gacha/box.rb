module Gacha
  class Box
    def initialize()
      self.clear
      @consumable = false
    end

    def to_s
      "Gacha::Box #{@items.join(", ")}"
    end

    def draw
      position = self.random_position
      return nil if position == nil
      item = self.find(position)
      if item != nil and @consumable
        self.remove(item)
      end
      return item
    end

    def add(item)
      @items.push(item)
      @total_rate += item.rate
    end

    def remove(item)
      @items.delete_if do |x|
        x == item
      end
      @total_rate -= item.rate
    end

    def clear
      @items = []
      @total_rate = 0
    end

    def empty?
      @items.empty? and @total_rate == 0
    end

    def count
      @items.count
    end

    def set_consumable(consumable)
      @consumable = consumable
    end

    def consumable?
      @consumable
    end

  protected
    def random_position
      if @total_rate < 1
        nil
      else
        rand(@total_rate)
      end
    end

    def find(position)
      current = 0
      @items.each do |item|
        current += item.rate
        if position < current
          return item
        end
      end
      return nil
    end
  end
end
