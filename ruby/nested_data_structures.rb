#I will be representing a kitchen
kitchen = {

  stove: ["broiler", "oven", "range"],

  refrigerator: {

    fridge: {
      top_shelf: ["rice milk", "juice", "soup stock", "large containers of leftovers"],
      middle_shelf: ["leftovers", "peanut butter", "pasta sauce"],
      bottom_shelf: ["hot dogs", "eggs"],
      crisper: ["carrots", "romaine lettuce", "beets"],
      cheese_drawer: ["cheddar", "mozzarella", "Parmesan", "Brie", "chevre", "muenster"],
      door: ["milk", "salad dressings", "jam", "beer"]
    },

    freezer: ["peas", "corn", "bananas", "ice", "berries", "pizzas", "ice cream"]

  },

  drawers: {

    utensils: {
      forks: 10,
      knives: 8,
      spoons: 5,
      straws: 22,
      desert_forks: 4,
      chop_sticks: 8
    },

    tools: ["cheese grater", "ladle", "spatula (metal)", "spatula (rubber)", "tongs", "knives"],

  },

  realizing_kitchens_have_too_many_things: "Everything else!"
}


puts kitchen[:stove][2]
puts kitchen[:refrigerator][:fridge][:middle_shelf][1]
puts kitchen[:drawers][:tools][1].upcase