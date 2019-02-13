## Oyster Cards Makers Project

Tackling the Makers pair programming challenge - found here: https://github.com/makersacademy/course/tree/master/oystercard


## How to use

#### Topping up a card

Any instance of an oystercard can be topped up with a given monetary amount by calling the method `top_up` on the oystercard and passing an integer argument of the desired top-up amount.

E.g. `my_oystercard.top_up(10)` will top £10.

Cards have a maximum balance limit of £90. If a user tries to top up a card taking the balance beyond this, the top-up will be unsuccessful and they'll receive an error message.

E.g. `my_oystercard.top_up(150)` will give the error message `top-up unsuccessful, maximum balance of £90 exceeded`.

#### Deducting money from a card

Using the method `deduct` with an integer argument on an instance of Oystercard will reduce the balance on the card by the given amount.

E.g. `my_oystercard.deduct(15)` will take £15 off the card.

#### Touching in and out of journeys

Using the method `touch_in` on an instance of Oystercard will update the `in_journey?` method to return `true`.

The entry station must be passed to `touch_in`, and the card must record this. Calling `my_oystercard.entry_station` should return the station passed.

Using the method `touch_out` on an instance of Oystercard will update the `in_journey?` method to return `false`.

Touching out of journeys will reduce the balance of the card by the minimum fare amount (£1).

When calling `touch_out`, the entry station should be set to `nil`.

#### Minimum amount for journeys

When the oystercard balance is less than 1 (EG when the oyster card is first created), calling the method `touch_in` on an instance of Oystercard will throw an error "Insufficient balance to touch in."

#### Journey history

Each time a journey is made the entry station is recorded through the `touch_in` method, and the exit station is recorded through the `touch_out` method. These two pieces of information are stored as a hash. A card's overall journey history is stored as an array of hashes called `journey_history`.

#### Stations

Each station in the network is an instance of the Station class. Each station has a `name` and `zone` attribute.

### Journey Class

Create a Journey Class that has an entry and an exit station

