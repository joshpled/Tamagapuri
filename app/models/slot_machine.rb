class SlotMachine < ApplicationRecord
  def bid(user)
    user.rupees -= 1
    case [self.slot_1, self.slot_2, self.slot_3]
    when [0, 0, 0]
      user.rupees += 25
      user.save
      "You've won 25 rupees!"
    when [1, 1, 1]
      user.rupees += 50
      user.save
      "You've won 50 rupees!"
    when [2, 2, 2]
      user.rupees += 75
      user.save
      "You've won 75 rupees!"
    when [3, 3, 3]
      user.rupees += 100
      user.save
      "You've won 100 rupees!"
    when [4, 4, 4]
      user.rupees += 1000
      user.save
      "You've won 1000 rupees!"
    else
      user.rupees += 10
      user.save
      "You've won 10 rupees!"
    end
  end

  def outcomes
    a = []
    3.times do |slot|
      slot = rand(5)
      a << slot
    end
    return a
  end
end
