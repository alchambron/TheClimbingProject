const mappy = document.getElementById("map")

let longitude = parseFloat(mappy.getAttribute("data-longitude"))
let latitude = parseFloat(mappy.getAttribute("data-latitude"))
console.log(longitude, latitude)
let map = L.map('map').setView([longitude, latitude], 13);
L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

let marker = L.marker([longitude, latitude]).addTo(map);