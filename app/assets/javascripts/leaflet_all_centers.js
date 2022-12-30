/* Voici ce que fait ce code :

Il parse le contenu de l'élément HTML avec l'ID centers-json, qui devrait contenir du JSON 
représentant un tableau de salles d'escalade (centers).

Il crée une carte Leaflet avec l'ID map et centre la carte sur les coordonnées GPS 
[46.61605556964202, 2.7054297799658555] à un zoom de 6. La carte est affichée avec des tuiles de OpenStreetMap.

Il crée un tableau vide markers qui servira à stocker les markers créés pour chaque salle d'escalade.

Pour chaque salle d'escalade dans le tableau centers, il crée un marker Leaflet et 
l'ajoute à la carte. La position du marker est déterminée en utilisant les coordonnées 
GPS de la salle d'escalade (center.latitude et center.longitude). Il ajoute également 
une popup au marker, qui affiche le nom de la salle d'escalade, sa description et un lien 
vers une page de détails de la salle d'escalade. 

Il ajoute un écouteur d'événement click au marker, qui appelle la fonction focusCenter 
lorsque le marker est cliqué.

Il ajoute le marker au tableau markers, avec son ID et l'objet marker.

Il définit la fonction focusMarker, qui prend en paramètre un objet contenant un ID et un 
marker et met en surbrillance le marker sur la carte. La fonction ferme toutes les popups 
ouvertes sur la carte et ouvre la popup du marker sélectionné. Elle ajoute également une 
classe CSS focused au marker sélectionné. La carte est également centrée sur le marker avec
une animation, en utilisant la méthode flyTo de Leaflet.

Il définit la fonction focusCenter, qui prend en paramètre un ID de salle d'escalade et met
en surbrillance la salle d'escalade correspondante dans la liste des salles d'escalade 
affichée à côté de la carte. Elle appelle également la fonction focusMarker pour mettre en 
surbrillance le marker correspond
*/

// Récupère les données JSON contenues dans l'élément HTML avec l'ID "centers-json"
const centers = JSON.parse(document.getElementById("centers-json").innerHTML);

// Crée une carte Leaflet et l'affiche dans l'élément HTML avec l'ID "map"
// La carte est centrée sur les coordonnées 46.61605556964202, 2.7054297799658555 et affiche un niveau de zoom de 6
let map = L.map('map').setView([46.61605556964202, 2.7054297799658555], 6);

// Ajoute une couche de tuiles OpenStreetMap à la carte
L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

// Crée un tableau vide pour stocker les marqueurs Leaflet
const markers = [];

// Pour chaque élément du tableau "centers", crée un marqueur Leaflet sur la carte
centers.forEach((center) => {
    // Crée un icône personnalisé pour le marqueur avec une image Leaflet par défaut comme contenu
    var markerIcon = L.divIcon({ className: 'marker-custom-icon', html: "<img src='https://unpkg.com/leaflet@1.9.3/dist/images/marker-icon.png'>", iconAnchor: [12.5, 41], popupAnchor: [0, -41] });

    // Crée un marqueur Leaflet à l'aide des coordonnées de "center" et de l'icône personnalisé
    const marker = L.marker([center.latitude, center.longitude], { icon: markerIcon }).addTo(map);

    // Ajoute une fenêtre contextuelle au marqueur avec des informations sur "center"
    marker.bindPopup(`
    <h4>${center.name}</h4>
    <p>${center.description}</p>
    <p style="text-align: right;"><a href="${center.id}">Plus de détails >></a></p>
    `);

    // Ajoute un écouteur d'événement "click" au marqueur qui appelle la fonction "focusCenter" avec l'ID de "center" en argument
    marker.addEventListener('click', function () {
        focusCenter(center.id);
    });

    // Ajoute un objet contenant l'ID de "center" et le marqueur Leaflet correspondant au tableau "markers"
    markers.push({ id: center.id, marker })
});

// Fonction qui met en valeur le marqueur Leaflet associé à un élément du tableau "centers"
function focusMarker(markerWithId) {
    // Ferme la fenêtre contextuelle de tous les marqueurs
    map.closePopup();

    // Supprime la classe "focused" de tous les marqueurs
    markers.forEach(m => {
        m.marker._icon.classList.remove("focused")
    });

    // Déplace la vue de la carte vers le marqueur en utilisant l'animation "flyTo"
    map.flyTo(markerWithId.marker.getLatLng(), 14, { duration: 1.5 });

    // Ouvre la fenêtre contextuelle du marqueur
    markerWithId.marker.openPopup();

    // Ajoute la classe "focused" au marqueur
    markerWithId.marker._icon.classList.add("focused");
}

// Fonction qui met en valeur l'élément HTML associé à un élément du tableau "centers"
function focusCenter(centerId) {
    // Supprime la classe "focused" de tous les éléments HTML avec la classe "center"
    document.querySelectorAll('.center').forEach(function (c) { c.classList.remove('focused') })

    // Récupère l'objet contenant l'ID et le marqueur Leaflet associé à "centerId" dans le tableau "markers"
    const markerWithId = markers.find(marker => marker.id == centerId);

    // Appelle la fonction "focusMarker" avec l'objet récupéré en argument
    focusMarker(markerWithId);

    // Récupère l'élément HTML associé à "centerId"
    const divForCenter = getDivForCenter(centerId);

    // Ajoute la classe "focused" à l'élément HTML récupéré
    divForCenter.classList.add('focused');
}

// Fonction qui récupère l'élément HTML associé à un élément du tableau "centers"
function getDivForCenter(centerId) {
    // Récupère tous les éléments HTML avec la classe "center"
    const allCentersDivs = [...document.querySelectorAll('.center')]

    // Récupère l'élément HTML qui a l'attribut "data-center-id" égal à "centerId" parmi tous les éléments récupérés
    const divForCenterId = allCentersDivs.find(c => c.getAttribute('data-center-id') == centerId)

    // Retourne l'élément HTML récupéré
    return divForCenterId;
}

// Fonction qui ajoute la classe "over" à l'image de l'icône du marqueur Leaflet associé à un élément du tableau "centers"
function startMarkerAnimation(centerId) {
    // Récupère l'objet contenant l'ID et le marqueur Leaflet associé à "centerId" dans le tableau "markers"
    const markerWithId = markers.find(marker => marker.id == centerId);

    // Récupère l'image de l'icône du marqueur
    markerWithId.marker._icon.childNodes[0].classList.add('over');
}

// Fonction qui supprime la classe "over" de l'image de l'icône du marqueur Leaflet associé à un élément du tableau "centers"
function stopMarkerAnimation(centerId) {
    // Récupère l'objet contenant l'ID et le marqueur Leaflet associé à "centerId" dans le tableau "markers"
    const markerWithId = markers.find(marker => marker.id == centerId);

    // Récupère l'image de l'icône du marqueur
    markerWithId.marker._icon.childNodes[0].classList.remove('over');
}