// calendar input validation

const calendar = document.querySelector("#arrivalDate");

function restrict(e) {
    document.getElementById("arrivalDate").setAttribute("min", tomorrow);
}

calendar.addEventListener("click", restrict);

let today = new Date();
let dd1 = today.getDate() + 1;
let mm = today.getMonth() + 1;
let yyyy = today.getFullYear();
if (dd1 < 10) {
    dd1 = '0' + dd1;
}
if (mm < 10) {
    mm = '0' + mm;
}
tomorrow = yyyy + '-' + mm + '-' + dd1;
