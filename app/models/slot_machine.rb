class SlotMachine < ApplicationRecord
  def bid_game(user)
    user.rupees -= self.bid
    a = [self.slot_1, self.slot_2, self.slot_3].uniq
    case a
    when [0]
      x = 100 * self.bid
    when [1]
      x = 150 * self.bid
    when [2]
      x = 175 * self.bid
    when [3]
      x = 200 * self.bid
    when [4]
      x = 1000 * self.bid
    else
      if a.length == 2
        x = 10 * self.bid
      else
        x = 0
      end
    end
    user.rupees += x
    user.save
    if x > 0
      "You've won #{x} rupees!"
    else
      "Better Luck Next Time!"
    end
  end

  def outcomes
    self.update(slot_1: rand(5), slot_2: rand(5), slot_3: rand(5))
  end
end
