const mappy = document.getElementById("map")

let longitude = parseFloat(mappy.getAttribute("data-longitude"))
let latitude = parseFloat(mappy.getAttribute("data-latitude"))

const coords = [latitude, longitude]
console.log(coords)
let map = L.map('map').setView(coords, 12);
L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

let marker = L.marker(coords).addTo(map);