module Gacha
  class Item
    attr_accessor :rate, :id

    def initialize(id, rate)
      @id = id
      @rate = rate
    end

    def to_s
      "(#{@id}, #{@rate})"
    end
  end
end
