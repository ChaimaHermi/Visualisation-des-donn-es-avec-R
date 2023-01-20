library(tidyverse)
library(nycflights13)
data(flights)
data(airports)
data(airlines)


#Question 1 :	Sélectionner les lignes 100 à 105 du tableau des vols (flights):
#j'ai 2 m�thodes : 
#sans slice 
Vols<-flights[100:105,]
#avec slice
Vols<-slice(flights,100:105)




#Question 2 :	Sélectionnez les vols du mois de juillet et de septembre (variable month).
vols_jul_sep<-flights[flights$month==7 | flights$month==9,]
#avec filter
VOL_jul_SEP<-filter(flights,month==7 | month==9)



#Question 3 :3.	Sélectionnez les vols avec un retard à l’arrivée (variable arr_delay) compris entre 10 et 15 minutes
#avec filter :
vols_R <-filter(flights,dep_delay>=10 & dep_delay<=15)
view(vols_R)




#Question 4:	Sélectionnez les vols des compagnies Delta, United et American (codes DL, UA et AA de la variable carrier).
vols_c<-flights[flights$carrier=="DL" | flights$carrier=="UA" | flights$carrier=="AA",]
view(vols_c)
# avec filter
vols_c<-filter(flights,carrier=="DL" | carrier=="UA"| carrier=="AA" )
view(vols_c)



#Question 5 : Triez la table flights par retard au départ (variable dep_delay) décroissant.
?arrange 
 VolsR_D<- arrange (flights ,desc(dep_delay)) 
 
 
 #Question 6 : Sélectionnez les colonnes name, lat et lon de la table airports.
Colonnes<-airports %>%
  select(name,lat,lon)
view(Colonnes)




#Question 7 :	Sélectionnez toutes les colonnes de la table airports sauf les colonnes tz et tzone.
Colonnes<-airports %>%
  select(airports,-tz,-tzone)
view(Colonnes)



#Question 8:	Toujours dans la table airports, renommez la colonne lat en latitude et lon en longitude.
  new_names<-airports %>%
    select(lat,lon)%>%
    rename("lattitude"=lat,"longitude"=lon)
view(new_names)




#Question 9 : 	Dans la table airports,la colonne alt contient l’altitude de l’aéroport en pieds. 
#Créer une nouvelle variable alt_m contenant l’altitude en mètres (on convertit des pieds en mètres en les divisant par 3.2808).
#Sélectionner dans la table obtenue uniquement les deux colonnes alt et alt_m.

airports<-mutate(airports,alt_m=(alt/3.2808))
view(airports)
 select(airports,alt,alt_m)


 
#Question 10:Dans la table flights et en utilisant le pipe >%>, sélectionnez les vols à destination de San Francico (code SFO de la variable dest)
#et triez-les selon le retard au départ décroissant (variable dep_delay).
 
SFO<-flights %>% filter(dest=="SFO")
view(SFO)
SFO_desc<-arrange(SFO,desc(dep_delay))
view(SFO_desc)






#Question 11 :Sélectionnez les vols des mois de Janvier et Mars, conservez seulement les colonnes dest et dep_delay, 
#créez une nouvelle variable retard_h contenant le retard au départ en heures (*60), triez selon retard_h par ordre décroissant et conservez uniquement les 15 premières lignes (slice).
VOL_jan_Mar<-filter(flights,month==1 | month==3)
VOL_jan_Mar<-mutate(VOL_jan_Mar,retard_h=(dep_delay*60))
retard_desc<-arrange(VOL_jan_Mar,desc(retard_h)) 
retard_desc %>% slice_head(n=15)




#Question 12 : 	Pour la table flights, affichez le nombre de vols par mois (utiliser la fonction n=n()) 
#et trier la table résultante selon le nombre de vols croissant.
?n()

flights %>%
  count(month) %>%
  arrange(n)



#Question 13 :	Pour la table flights, 
#calculer la distance moyenne des vols (variable distance) selon l’aéroport de départ (variable origin).

flights %>%
  group_by(origin) %>%
summarise(flights,moydis=mean(distance))





#Question 14 :	Pour la table flights, calculer le nombre de vols sortant de l’aéroport JFK (code JFK) pour chaque mois de l’année.
#(utiliser l’expression count(month))
flights %>%  count(month,origin="JFK")


#Question 15 : Pour la table flights, calculer le nombre de vols selon le mois et la destination.
flights %>%  count(month,dest) 




#Question 16 :Pour la table flights, Calculer le nombre de vols selon le mois. Ajouter 
#une colonne comportant le pourcentage de vols annuels réalisés par mois.
flights %>% 
  count(month) %>% 
  mutate(pourcentage_Vols = (n / sum(n) * 100))





#Question 17: 	Pour la table flights, calculer, pour chaque destination et chaque mois,
#le retard moyen à l’arrivée. Pour chaque mois, trier les destinations selon ce retard moyen décroissant, et (toujours pour chaque mois) ne conserver que les trois destinations avec le retard le plus important
flights %>% 
  group_by(month,dest) %>% 
  summarise(moyR=mean(arr_delay,na.rm=TRUE)) %>% 
  arrange(desc(moyR))
  
#Question 18 :Faire la jointure de la table airlines sur la table flights à l’aide de left_join.
join<-airlines %>% left_join(flights)




#Question 19 : 19.	À partir de la table résultat de la question précédente, calculer le retard moyen au départ pour chaque compagnie,
#trier selon ce retard décroissant et ne conserver que le nom de la compagnie et le retard correspondant.
flights %>%
  left_join(airlines) %>%
  group_by(name) %>%
  summarise(retard_moyen = mean(dep_delay, na.rm = TRUE)) %>%
  arrange(desc(retard_moyen))


#Question 20 : Faire la jointure de la table�airports�sur la table�flights�en utilisant comme cl� le code de l'a�roport de destination.
flights %>%
  left_join(airports, by = c("dest" = "faa"))

#Question 21 : Calculer le nombre de vols selon l'a�roport de destination, et fusionnez la
#table�airports�sur le r�sultat avec�left_join. Stocker le r�sultat final dans un objet
#nomm�flights_dest.

flights_dest <- flights %>%
  count(dest) %>%
  left_join(airports, by = c("dest"="faa"))

#Question 22 :Calculer le nombre de vols selon l'a�roport de destination, et fusionnez la
#table�airports�sur le r�sultat avec�left_join. Stocker le r�sultat final dans un objet
#nomm�flights_dest.

#Comme question 21 


