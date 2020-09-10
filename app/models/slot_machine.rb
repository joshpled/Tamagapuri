class SlotMachine < ApplicationRecord
  def bid(user)
    user.rupees -= 1
    case [self.slot_1, self.slot_2, self.slot_3]
        when [0, 0, 0]
          x = 25
        when [1, 1, 1]
          x = 50
        when [2, 2, 2]
          x = 75
        when [3, 3, 3]
          x = 100
        when [4, 4, 4]
          x = 1000
        else
          x = 10
        end
    user.rupees += x
    user.save
    "You've won #{x} rupees!"
  end

  def outcomes
    self.update(slot_1: rand(5), slot_2: rand(5), slot_3: rand(5))
  end
end
