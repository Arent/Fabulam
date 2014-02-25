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

-   Travel
Een complexe view, waar alle informatie van de site samenkomt. Waaronder een lijst met rijzen, logout button, alle photo's per reis en een map
Deze view is dan ook gelinked aan SessionController, TravelControler en MapControler



## Models (Databases


## Frameworks/languages

-   Ruby on Rails 4.02
-   Jquerry 
-   Omniouth-facebook 			github.com/mkdynamic/omniouth-facebook turorial https://coderwall.com/p/bsfitw
-   Skeleton design				github.com/dhg/Skeleton
-   Paperclip (photo upload)	github.com/thoughtbot/paperclip
-   Amcharts voor kaart			http://www.amcharts.com/tutorials/your-first-ammap/

---
