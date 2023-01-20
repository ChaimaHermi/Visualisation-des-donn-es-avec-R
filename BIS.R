#Ex1 :


#1 1.	Charger le package ggplot2 et charger en m�moire le jeu de donn�es � economics �.
#Utiliser la page d'aide de ce jeu de donn�es pour prendre savoir le contenu de cette base.

library(ggplot2)
data(economics)
?economics
View(economics)



#2 	� l'aide de la fonction ggplot(), repr�senter les d�penses personnelles de consommation (pce) en fonction de la date (date).

#Repr�senter les points entre les deux variables
#Les points doivent �tre connect�es par une ligne.

ggplot(data = economics, aes(x = date, y = pce )) +geom_line()




#3	Modifier le graphique de la question pr�c�dente de mani�re � ce que la couleur de la ligne soit � dodger blue � et d�finir la taille de la ligne � 0.3 et sa transparence � 0.5.
#Stocker le r�sultat dans un objet que l'on appellera graphe_1.

graphe_1 <- ggplot(data = economics, aes(x = date, y = pce)) +
  geom_line(colour = "dodger blue", size = 0.3 , alpha=0.5)
graphe_1


#4 4.	Ajouter une couche au graphique graphe_1 pour modifier les titres des axes (les retirer), 
#et ajouter le titre suivant : "Personal Consumption Expenditures (billions dollars)".

graphe_1 +xlab("") + ylab("") + ggtitle("Personal Consumption Expenditures (billions dollars)")


#5 :5.	Utiliser la fonction date_breaks() du package scales pour modifier l'�chelle des abscisses du graph_1, afin que les �tiquettes des marques soient affich�es tous les 4 ans . 
#En utilisant la fonction date_format(),changer le format de ces �tiquettes pour afficher seulement les ann�es de la variable date.

library(scales)
graphe_1+scale_x_date(breaks = date_breaks("4 year"),
                      labels = date_format("%Y"))







                      #EX2 :
#1 :  r�ponse existe d�ja dans le projet 

library(WDI)
# NY.GDP.PCAP.PP.KD (GDP per capita, PPP (constant 2005 international $))
# SL.UEM.TOTL.ZS (Unemployment, total (% of total labor force))
table1<- WDI(country = c("FR", "GB", "DE"),
             indicator = c("NY.GDP.PCAP.PP.KD", "SL.UEM.TOTL.ZS"),
             start = 1990, end = 2015)
head(table1)




#2 : r�ponse existe d�ja dans le projet 
table1<-table1 %>%
  select(-iso2c) %>%
  gather(variable, valeur, NY.GDP.PCAP.PP.KD, SL.UEM.TOTL.ZS)%>%
  mutate(variable = factor(variable,
                           levels = c("NY.GDP.PCAP.PP.KD", "SL.UEM.TOTL.ZS"),
                           labels = c("GDP", "Unemployment")))













#3.Repr�senter graphiquement l'�volution du PIB (GDP) et du taux de ch�mage (Unemployement) pour les trois pays. 
#Utiliser la fonction facet_wrap() afin de regrouper les valeurs par type de variable : 
 # les observations des valeurs du PIB d'un c�t�, et celles du taux de ch�mage de l'autre.
#Utiliser une repr�sentation en ligne, en faisant d�pendre la couleur du pays (country) ;
#n'afficher pas les titres des axes en utilisant les fonction ylab() et xlab().

ggplot(data = table1, aes(x = year, y = valeur, colour = country)) + geom_line() + facet_wrap(~variable) + ylab("") + xlab("")








#4 	Reprendre le m�me code que celui de la question 3 en ajoutant � la fonction facet_wrap l'argument scales= 'free_y'.

ggplot(data = table1, aes(x = year, y = valeur, colour = country)) +
geom_line() +
  facet_wrap(~variable, scales = "free_y") +
  ylab("") + xlab("")





#5  	Modifier les param�tres esth�tiques du graphique afin de faire modifier le type de ligne des pays de la mani�re suivante : 
#des points pour la France, des tirets pour l'Allemagne,
#des tirets longs pour le Royaume Uni. D�finir l'�paisseur des lignes � 0.8. Utiliser la fonction scale_linetype_manual() (chercher sur google les diff�rents types de lignes dans ggplot2).


ggplot(data = table1, aes(x = year, y = valeur, colour = country)) +
  geom_line(aes(linetype = country), size = 0.8) +
  scale_linetype_manual("country",
                        values = c("France" = "dotted",
                                   "Germany" = "dashed",
                                   "United Kingdom" = "longdash")) +
  facet_wrap(~variable, scales = "free_y") +
  ylab("") + xlab("")







#6 Modifier l�g�rement le code ayant permis de r�aliser le graphique de la question pr�c�dente pour que la direction ne soit non plus horizontale (par d�faut),
#mais verticale  (indication : ajouter un argument au niveau de la fonction facet_wrap()).


ggplot(data = table1, aes(x = year, y = valeur, colour = country)) +
  geom_line(aes(linetype = country), size = 1.5) +
  scale_linetype_manual("country",
                        values = c("France" = "dotted",
                                   "Germany" = "dashed",
                                   "United Kingdom" = "longdash")) +
  facet_wrap(~variable, scales = "free_y", dir = "v") +
  ylab("") + xlab("")








#7 7.	En niveau de la fonction facet_wrap(), modifier le premier argument pour repr�senter chaque s�rie dans un des panels,
#de sorte qu'un panel repr�sente l'�volution d'une s�rie pour un pays donn� ;


ggplot(data = table1, aes(x = year, y = valeur)) +
  geom_line() +
  facet_wrap(country~variable, scales = "free_y") +
  ylab("") + xlab("")




#8	Maintenant  utiliser la fonction facet_grid() pour cr�er une grille de graphiques dans laquelle les lignes correspondent aux pays et les colonnes aux variables.
#Prendre soin de lib�rer les �chelles (utiliser l'argument scales= � free �.

ggplot(data = table1, aes(x = year, y = valeur)) +
  geom_line() +
  facet_grid(country~variable, scales = "free") +
  ylab("") + xlab("")






#9	Reprendre la question pr�c�dente en modifiant le premier argument de la fonction facet_grid() pour cr�er  une girlle dans laquelle
#les lignes correspondent aux variables et les colonnes aux pays


ggplot(data = table1, aes(x = year, y = valeur)) +
  geom_line() +
  facet_grid(variable~country, scales = "free") +
  ylab("") + xlab("")



