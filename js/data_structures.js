var colors = ["blue", "green", "vomit", "puce"];
var names = ["Ed", "Edd", "Eddie", "Plank"];
colors.push("turquoise");
names.push("Rolf");
// console.log(colors);
// console.log(names);

//Math.floor(Math.random() * (colors.length)) creates a random number between zero and length of array-1 (possible indices)
var horses = {};
horses[names[Math.floor(Math.random() * (colors.length))]] = colors[Math.floor(Math.random() * (colors.length))];
console.log(horses);

Math.floor(Math.random() * (colors.length));