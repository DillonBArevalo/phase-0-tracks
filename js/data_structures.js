var colors = ["blue", "green", "vomit", "puce"];
var names = ["Ed", "Edd", "Eddie", "Plank"];
colors.push("turquoise");
names.push("Rolf");
// console.log(colors);
// console.log(names);

//Math.floor(Math.random() * (colors.length)) creates a random number between zero and length of array-1 (possible indices)
var horses = {};
horses[names[Math.floor(Math.random() * (names.length))]] = colors[Math.floor(Math.random() * (colors.length))];
// console.log(horses);

var models = ["Model-T", "CR-V", "Civic", "Prius", "Explorer"];

function Car(color, model, nickname){
  this.color = color;
  this.model = model;
  this.nickname = nickname;
  this.drive = function() { console.log("*Vroom vroom!*"); };
}


for (i=0; i<10; i++){
  var car = new Car(colors[Math.floor(Math.random() * (colors.length))], models[Math.floor(Math.random() * (models.length))], names[Math.floor(Math.random() * (names.length))]);
  car.drive();
  console.log(car);
}
