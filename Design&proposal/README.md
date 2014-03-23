---

# Fabulam
Gebruikers moeten op een intuitieve manier een visueel imponerende impressie kunnen geven van hen reis. 

## Controllers

-  SessionControler
Deze controler maakt en verwijderd gebruikers. (Via Omniouth-facebook)
f1 - createUser
f2 - deleteUser

-  TravelController
Deze controler coordineert tussen de 'Travel' en 'Edit' View en de Travel database
f1 - listAllTravels
f2 - getPhoto's
f3 - addTravel
f4 - deleteTravel
f5 - AddPhoto's
f6 - deletePhoto's

-  MapController
Verzameld en creeert informatie voor het maken van een map
f1 - getPositions
f2 - displayPositions 

## Views

-   Home
Een simplele pagina met een loginbutton en een plaatje. Alleen gelinked aan sessionControler

-   Travel
Een complexe view, waar alle informatie van de site samenkomt. Waaronder een lijst met rijzen, logout button, alle photo's per reis en een map
Deze view is dan ook gelinked aan SessionController, TravelControler en MapControler

-   Edit
Een relatief simpele view die gebruikt wordt voor het aanmaken/verwijderen van reizen en foto's
Deze is gelinked aan TravelController en SessionController




## Models (Databases
Zie plaatje

---
