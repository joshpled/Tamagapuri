# Tamagapuri
> Pet keeper application similar to the popular keychain pets of the late 90’s.

## Table of contents
* [General info](#general-info)
* [Screenshots](#screenshots)
* [Technologies](#technologies)
* [Setup](#setup)
* [Features](#features)
* [Future Developments](#future-developments)
* [Status](#status)
* [Inspiration](#inspiration)
* [License](#license)
* [Contact](#contact)

## General Info
In the late 90s, Bandai released to the world the “Tamagotchi!” It was AWESOME! I was only 7 years old, but they were wildly popular, many iterations came after, and by the early 2000s, I got to play with one! I was hooked. I still love the concept of a virtual pet to take care of. Probably because I don’t trust myself with a real pet. Especially after I heard a weird sound coming from my Tamagotchi and saw my frog like creature in angel wings to signify that I had in fact killed my pet. It was… traumatizing.

This is the inspiration behind Tamapuri! According to wikipedia, Tamagotchi, “the name is a portmanteau combining the two Japanese words tamago (たまご), which means “egg”, and uotchi (ウオッチ) “watch”.

Well since my project isn’t on a handheld device, or at least not a watch, I created my own portmanteau of Tamago and Apuri (アプリ) which means “App”!

## Screenshots
<div align="center"><img src="https://i.imgur.com/rAlcZSZ.png" width="300px"></div>
<div align="center"><img src="https://i.imgur.com/dWiDdjm.png" width="300px"></div>
<div align="center"><img src="https://i.imgur.com/YsBSSW4.png" width="300px"></div>


## Technologies
* Ruby on Rails - Ruby version 2.6.1 and Rails version 6.0.3 as API
* PostgreSQL - version 12.4
* Bootstrap - version 4.5.3
* Ruby gems: devise, omniauth, rufo, awesome_print

## Setup
Fork and Clone then run:
```
rails db:create
rails db:migrate
// optional: rails db:seed
rails s
```

## Code Examples
```
class Monster < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  before_update :average_happiness

  scope :least_happy, -> { order(happiness: :asc) }

  def give_item_to_monster(params)
    inventory = Inventory.find_by_id(params[:monster][:inventory_id])
    case inventory.item.item_type
    when "food"
      self.update_properties({ 'hunger': inventory.item.effectiveness, 'boredom': -(rand(1..3)) })
    when "medicine"
      self.update_properties({ 'health': inventory.item.effectiveness, 'hunger': -(rand(1..3)) })
    when "toy"
      self.update_properties({ 'boredom': inventory.item.effectiveness, 'hunger': -(rand(1..3)) })
    when "other"
      self.update_properties({ 'hunger': inventory.item.effectiveness, 'boredom': 0 })
      self.update_properties({ 'health': inventory.item.effectiveness, 'boredom': 0 })
      self.update_properties({ 'boredom': inventory.item.effectiveness, 'boredom': 0 })
    else
      nil
    end
    inventory.quantity -= 1
    inventory.save
    return true
  end

  def update_properties(hash)
    self.update(hash.keys[0].to_s => (self.attributes[hash.keys[0].to_s] + hash.values[0]).clamp(0, 5), hash.keys[1].to_s => (self.attributes[hash.keys[1].to_s] + hash.values[1]).clamp(0, 5))
  end

  def happy?
    case self.happiness
    when 5
      "Great!"
    when 4
      "Alright"
    when 3
      "OK."
    else
      "not so well..."
    end
  end

  def monster_age
    self.age = (((Time.now - self.created_at.localtime) / 1.hour) / 24).round
    self.age = self.age.clamp(1, 100)
    self.save
  end

  private

  def average_happiness
    self.happiness = (self.health + self.hunger + self.boredom) / 3
  end
end
```
```
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
```

## Features
* Create multiple pets
* User Authentication
* Get items from shop
* Slot Machines for money
* A rupee money system
* Github OmniAuth

## Future Developments
* Mobile Application (Progressive Web App | React Native)
* Firebase implementation

## Status
IN DEVELOPMENT

## Inspiration
In the late 90s, Bandai released to the world the “Tamagotchi!” It was AWESOME! I was only 7 years old, but they were wildly popular, many iterations came after, and by the early 2000s, I got to play with one! I was hooked. I still love the concept of a virtual pet to take care of. Probably because I don’t trust myself with a real pet. Especially after I heard a weird sound coming from my Tamagotchi and saw my frog like creature in angel wings to signify that I had in fact killed my pet. It was… traumatizing.

This is the inspiration behind Tamagapuri! According to wikipedia, Tamagotchi, “the name is a portmanteau combining the two Japanese words tamago (たまご), which means “egg”, and uotchi (ウオッチ) “watch”.

Well since my project isn’t on a handheld device, or at least not a watch, I created my own portmanteau of Tamago and Apuri (アプリ) which means “App”!

## License
Copyright (c) 2020 Joshua Perez Leduc

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Contact
Created by Joshua Perez Leduc

 Tamagapuri

Rails, Ruby, Postgresl, devise, omniauth 

## Installation

After forking and cloning:

```
bundle install

rails db:create 

rails s
```

go to localhost:3000

## Usage

The app has user authentication via HTTP Cookies and Rails Sessions.
Simply create an account and via the Dashboard, Create a monster!


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)




## Installation

```bash
bundle install
```

## Usage

Run the server 

```ruby
rails s 
```

## License
[MIT](https://choosealicense.com/licenses/mit/)