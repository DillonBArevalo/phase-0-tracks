

var item_to_modify = document.getElementById("bold");
item_to_modify.style.border = "2px solid green";

function modify_if_clicked(event) {
  event.target.style.color = "red";
};

var paragraph = document.getElementById("paragraph");
paragraph.addEventListener("click", modify_if_clicked)