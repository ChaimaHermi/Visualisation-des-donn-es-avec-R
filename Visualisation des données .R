#EXERCICE 1: Scatter-plot


#1. Charger la librairie ggplot2 dans votre environnement.
library(ggplot2)



#2. Affichez le début du tableau pour visualiser ses composants. Combien d’espèces
#sont représentées dans ce jeu de données ? Combien de variables quantitatives
#sont présentes ?
data(iris)
head(iris)
#on une seul espéce 'setosa' et on a 4 variables quantitatives
#'Sepal.Length ' , 'Sepal.Width' ,'Petal.Length','Petal.Width'


#3. Construisez le nuage de points représentant la Sepal.width en fonction de
#la Sepal.length à l’aide de geom_point().

graphe1<-ggplot(data = iris,mapping=aes(y=Sepal.Width , x=Sepal.Length)) +
  geom_point()
graphe1


#4. Donnez une couleur aux points respective à l’espèce représentée. Idem pour la
#forme des points.
graphe2<-ggplot(data = iris,mapping=aes(y=Sepal.Width , x=Sepal.Length ,colour = Species,shape=Species)) +
  geom_point() 
  graphe2



#5. Utilisez facet_grid() pour regrouper les points par espèce.
graphe3<-graphe2 +facet_grid(~Species)
graphe3

#6. Rajoutez un thème de votre choix ainsi qu’un titre. 

graphe4<-graphe3+theme_bw() +
labs(title='Linear modelling of sepal.width against Sepal.length(IRIS) ')

graphe4


#7. Utilisez stat_smooth(method = ...) pour ajuster un modèle linéaire aux
#points – un modèle par groupe d’espèce. Que représente la zone grisée ?

graphe5<-graphe4+
  stat_smooth(method = "lm") 
graphe5
  

#r�presente quoi :









 #Ex 2
 
library(ggplot2)
#1. Installez le package mlbench puis charger le jeu de données Glass.
install.packages(mlbench)
library(mlbench)
data("Glass")
View(Glass)


 #2À l’aide de geom_boxplot(), construisez les boxplots de la répartition
#du Calcium observé dans les verres analysés, en fonction de leur type.



graphe1<-ggplot(data = Glass,mapping=aes(x=Type , y=Ca)) +
  geom_boxplot()
graphe1

#3Utilisez un thème, un jeu de couleur non standard et rajoutez un titre à votre graphe.
graphe2<-ggplot(data = Glass,mapping=aes(x=Type , y=Ca , group=Type)) +
  geom_boxplot(aes(fill=Type)) +labs(title="Distribution de Calcium par Type")
graphe2





#4. � l'aide d'une couche de type�facet_xxx, affichez dans un m�me graphe les
#boxplots�- toujours en fonction du type de verre -�des �l�ments chimiques suivants :
 # Potassium, Calcium, Baryum et Fer. Vous aurez besoin dans un premier temps de
#transformer le jeu de donn�es initial afin de pouvoir facilement construire le graphe.
#Nous utilisons ici la fonction�reshape2::melt.




# reshape dataset
Glass.reshaped <- reshape2::melt(Glass[,6:10], id.vars="Type")
head(Glass.reshaped)
# build second plot

view(Glass.reshaped)
ggplot(data = Glass.reshaped, mapping=aes(x=Type , y=value)) +
  geom_boxplot(aes(fill=Type)) +
  facet_wrap(~variable) 
  





#5. Pensez � changer la contrainte sur les �chelles de la fonction�facet_xxx�pour que
#votre graphe soit le plus lisible possible.

ggplot(data = Glass.reshaped, mapping=aes(x=Type , y=value)) +
  geom_boxplot(aes(fill=Type)) +
  facet_wrap(~variable, scales='free_y')






#EXERCICE 3: Line plot
library(gapminder)
data("gapminder")
view(gapminder)

# description de la base de donn�es gapminder :
library(questionr)
describe(gapminder) 

#Structure 
str(gapminder)

#les noms des variables de la base de donn�es gapminder

names(gapminder)




#4 pays :  Algeria , Bahrain , China, Canada
pays<-filter(gapminder, country %in% c("Algeria", "China", "Canada","Bahrain"))
pays
  
Algeria<-filter(pays,country=="Algeria")
Algeria
Bahrain<-filter(pays,country=="Bahrain")
Bahrain
China<-filter(pays,country=="China")
China

Canada<-filter(pays,country=="Canada")
Canada


#1. Repr�senter vos graphes (trois variables) pour chaque pays � part.
#pour Algeria
G1<-ggplot(data=Algeria,mapping =  aes(x = year, y = lifeExp )) +geom_line()
G1

G2<-ggplot(data=Algeria,mapping =  aes(x = year, y = pop )) +geom_line()
G3<-ggplot(data=Algeria,mapping =  aes(x = year, y = gdpPercap )) +geom_line()


#pour Bahrain
G4<-ggplot(data=Bahrain,mapping =  aes(x = year, y = lifeExp )) +geom_line()
G5<-ggplot(data=Bahrain,mapping =  aes(x = year, y = pop )) +geom_line()
G6<-ggplot(data=Bahrain,mapping =  aes(x = year, y = gdpPercap )) +geom_line()



#pour Canada
G7<-ggplot(data=Canada,mapping =  aes(x = year, y = lifeExp )) +geom_line()
G8<-ggplot(data=Canada,mapping =  aes(x = year, y = pop )) +geom_line()
G9<-ggplot(data=Canada,mapping =  aes(x = year, y = gdpPercap )) +geom_line()



#pour China

G10<-ggplot(data=China,mapping =  aes(x = year, y = lifeExp )) +geom_line()
G11<-ggplot(data=China,mapping =  aes(x = year, y = pop )) +geom_line()
G12<-ggplot(data=China,mapping =  aes(x = year, y = gdpPercap )) +geom_line()


#2Pour chacune des variables donner un titre et un th�me de votre choix du package
library(ggthemes)
?ggthemes

#pour Algeria 
G1+ggtitle("l'�volution dans le temps (Year) de l'esp�rance de vie (lifeExp) 
                           de la pays Algeria ") +theme_excel_new()
G2+ggtitle("l'�volution dans le temps (Year) de la population (pop)
                           de la pays Algeria ") +theme_excel_new()
G3+ggtitle("l'�volution dans le temps (Year) du PIB (gdpPercap)
                           de la pays Algeria ") +theme_excel_new()
#pour Bahrain
G4+ggtitle("l'�volution dans le temps (Year) de l'esp�rance de vie (lifeExp) 
                           de la pays Bahrain ") +theme_excel_new()
G5+ggtitle("l'�volution dans le temps (Year) de la population (pop)
                           de la pays Bahrain ") +theme_excel_new()
G6+ggtitle("l'�volution dans le temps (Year) du PIB (gdpPercap)
                           de la pays Bahrain ") +theme_excel_new()


#pour Canada

G7+ggtitle("l'�volution dans le temps (Year) de l'esp�rance de vie (lifeExp) 
                           de la pays Canada ") +theme_excel_new()
G8+ggtitle("l'�volution dans le temps (Year) de la population (pop)
                           de la pays Canada ") +theme_excel_new()
G9+ggtitle("l'�volution dans le temps (Year) du PIB (gdpPercap)
                           de la pays Canada ") +theme_excel_new()

#pour china 

G10+ggtitle("l'�volution dans le temps (Year) de l'esp�rance de vie (lifeExp) 
                           de la pays Chine") +theme_excel_new()
G11+ggtitle("l'�volution dans le temps (Year) de la population (pop)
                           de la pays Chine ") +theme_excel_new()
G12+ggtitle("l'�volution dans le temps (Year) du PIB (gdpPercap)
                           de la pays Chine ") +theme_excel_new()






#3Pour chaque variable, repr�senter dans un m�me graphique l'�volution des 4 pays
#dans le m�me graphe.
ggplot(data=pays,mapping =  aes(x = year, y = lifeExp , group=country)) +geom_line()

ggplot(data=pays,mapping =  aes(x = year, y = pop , group=country)) +geom_line()

ggplot(data=pays,mapping =  aes(x = year, y = gdpPercap , group=country)) +geom_line()





#4. S�parer entre les courbes obtenus en utilisant l'option facet_wrap()

ggplot(data=pays,mapping =  aes(x = year, y = lifeExp , group=country )) +geom_line()+facet_wrap(~country)

ggplot(data=pays,mapping =  aes(x = year, y = pop , group=country)) +geom_line()+facet_wrap(~country)

ggplot(data=pays,mapping =  aes(x = year, y = gdpPercap , group=country)) +geom_line()+facet_wrap(~country)




#5Pour l'ensemble des graphiques ajouter un layer pour repr�senter les points sur les
#courbes (choisissez des tailles (size) et des formes (shape) diff�rentes.


ggplot(data=pays,mapping =  aes(x = year, y = lifeExp , group=country , shape=country )) +geom_point(size=2)+facet_wrap(~country)

ggplot(data=pays,mapping =  aes(x = year, y = pop , group=country,shape=country)) +geom_point(size=2)+facet_wrap(~country)

ggplot(data=pays,mapping =  aes(x = year, y = gdpPercap , group=country,shape=country)) +geom_point(size=2)+facet_wrap(~country)



#6 Modifier le niveau de transparence des courbes.

ggplot(data=pays,mapping =  aes(x = year, y = lifeExp , group=country , shape=country )) +geom_point(size=2,alpha=0.5)+facet_wrap(~country)

ggplot(data=pays,mapping =  aes(x = year, y = pop , group=country,shape=country)) +geom_point(size=2,alpha=0.5)+facet_wrap(~country)

ggplot(data=pays,mapping =  aes(x = year, y = gdpPercap , group=country,shape=country)) +geom_point(size=2,alpha=0.5)+facet_wrap(~country)




#7 :Modifier l'�chelle des axes des ordonn�es en utilisant la fonction scale_y_log10()
ggplot(data=pays,mapping =  aes(x = year, y = lifeExp , group=country , shape=country )) +
  geom_point(size=2,alpha=0.5)+ facet_wrap(~country)+scale_y_log10()

ggplot(data=pays,mapping =  aes(x = year, y = pop , group=country,shape=country)) +
  geom_point(size=2,alpha=0.5)+facet_wrap(~country)+scale_y_log10()

ggplot(data=pays,mapping =  aes(x = year, y = gdpPercap , group=country,shape=country)) +
  geom_point(size=2,alpha=0.5)+facet_wrap(~country)+scale_y_log10()







#8Modifier le th�me de vos graphiques en utilisant une palette de couleur de votre
#chois de la fonction scale_fill_brewer()


install.packages("RColorBrewer")        # Install RColorBrewer package
library("RColorBrewer") 
?scale_fill_brewer()




#Rq : Dans geom_point on utilise  scale_color_brewer()

Graphe1<-ggplot(data=pays,mapping =  aes(x = year, y = lifeExp , group=country , shape=country , color=country)) +
  geom_point(size=2,alpha=0.5 , )+ facet_wrap(~country)+scale_y_log10()+scale_color_brewer(palette=8)
Graphe1
Graphe2<-ggplot(data=pays,mapping =  aes(x = year, y = pop , group=country,shape=country,color=country)) +
  geom_point(size=2,alpha=0.5)+facet_wrap(~country)+scale_y_log10()+scale_color_brewer(palette=5)
Graphe2
Graphe3<-ggplot(data=pays,mapping =  aes(x = year, y = gdpPercap , group=country,shape=country,color=country)) +
  geom_point(size=2,alpha=0.5 , aes(colour=country))+facet_wrap(~country)+scale_y_log10()+scale_color_brewer(palette=10)

Graphe3


#9 Rendre vos graphiques interactives en utilisant le package plotly et la fonction
#ggplotly()

?ggplotly

library(plotly)


ggplotly(Graphe1)
ggplotly(Graphe2)
ggplotly(Graphe3)









#EX4:
library(gapminder)
#1)G�n�rer d'abord une nouvelle base nomm�e �base1� qui contient les valeurs
#moyennes et les �carts-type pour les variables lifeExp et gdpPercap pour chaque
# pays. Utiliser les fonctions group_by et summarise().



pays<-filter(gapminder, country %in% c("Algeria", "China", "Canada","Bahrain","Australia","Brazil"))
pays

base1<-pays %>%  group_by(country)%>%
  
  summarise(moylifeExp=mean(lifeExp),ecartLifeExp=sd(lifeExp ),moygdp=mean(gdpPercap),ecartgdp=sd(gdpPercap))

base1





#2) En utilisant cette base, repr�senter les bar_plot pur les valeurs moyennes selon les
#caract�ristiques suivantes :

ggplot(data=base1,mapping =  aes(x = moylifeExp )) +geom_bar()
ggplot(data=base1,mapping =  aes(x = moygdp )) +geom_bar()





#- Les barres doivent �tre de couleurs diff�rentes : utiliser la package colourpicker et
#la fonction scale_fill_manual().
ggplot(data=base1,mapping =  aes(x = moylifeExp ,fill=country)) +
  geom_bar()+
  scale_fill_manual(values = c("brown","black","red","blue","green","pink"))


ggplot(data=base1,mapping =  aes(x = moygdp ,fill=country  )) +
  geom_bar()+
  scale_fill_manual(values = c("brown","black","red","blue","green","pink"))







#3)Chaque graphique doit porter un titre, un sous-titre (portant le nom de la base et la
#date de r�alisation du graphique), et la source. Modifier les titres des axes.

ggplot(data=base1,mapping =  aes(x = moylifeExp ,fill=country)) +
  geom_bar()+
  scale_fill_manual(values = c("brown","black","red","blue","green","pink"))+
  labs(title = "Valeur moyenne de l'�sperence de
  vie (lifeExp) pour les 6 pays",
       subtitle ="             gapminder , date: 05/05/2022",
       x="Esp�rence de vie",
       y="Valeurs")







ggplot(data=base1,mapping =  aes(x = moygdp ,fill=country  )) +
  geom_bar()+
  scale_fill_manual(values = c("brown","black","red","blue","green","pink"))+
  labs(title = "Valeur moyenne du PIB (gdpPercap)
       pour les 6 pays",
       subtitle ="             gapminder , date: 05/05/2022",
       x="PIB",
       y="Valeurs")








#4)Choisir un th�me de votre choix dans la liste des th�mes propos�e (theme_..())
library(ggthemes)
ggplot(data=base1,mapping =  aes(x = moylifeExp ,fill=country)) +
  geom_bar()+
  scale_fill_manual(values = c("brown","black","red","blue","green","pink"))+
  labs(title = "Valeur moyenne de l'�sperence de
  vie (lifeExp) pour les 6 pays",
       subtitle ="             gapminder , date: 05/05/2022",
       x="Esp�rence de vie",
       y="Valeurs")+
  theme_bw()






ggplot(data=base1,mapping =  aes(x = moygdp ,fill=country  )) +
  geom_bar()+
  scale_fill_manual(values = c("brown","black","red","blue","green","pink"))+
  labs(title = "Valeur moyenne du PIB (gdpPercap)
       pour les 6 pays",
       subtitle ="             gapminder , date: 05/05/2022",
       x="PIB",
       y="Valeurs")+
  theme_bw()








#5)Modifier le sens des barres en horizontal.


b1<-ggplot(data=base1,mapping =  aes(x = moylifeExp ,fill=country)) +
  geom_bar()+
  scale_fill_manual(values = c("brown","black","red","blue","green","pink"))+
  labs(title = "Valeur moyenne de l'�sperence de
  vie (lifeExp) pour les 6 pays",
       subtitle ="             gapminder , date: 05/05/2022",
       x="Esp�rence de vie",
       y="Valeurs")+
  theme_bw()+coord_flip()


b1




b2<-ggplot(data=base1,mapping =  aes(x = moygdp ,fill=country  )) +
  geom_bar()+
  scale_fill_manual(values = c("brown","black","red","blue","green","pink"))+
  labs(title = "Valeur moyenne du PIB (gdpPercap)
       pour les 6 pays",
       subtitle ="             gapminder , date: 05/05/2022",
       x="PIB",
       y="Valeurs")+
  theme_bw()+coord_flip()
b2




#6)Repr�senter dans le m�me graphiques l'esp�rance de vie moyenne et le PIB
#moyenne pour les 6 pays choisis.


install.packages(cowplot)
library(cowplot) 
plot_grid(B1,B2)




#7)Positionner les barres cote � cote (utiliser l'option position=�dodge�).




ggplot(data=base1,mapping =  aes(x = moylifeExp ,fill=country)) +
  geom_bar(position = "dodge")+
  scale_fill_manual(values = c("brown","black","red","blue","green","pink"))+
  labs(title = "Valeur moyenne de l'�sperence de 
  vie (lifeExp) pour les 6 pays",
       subtitle ="             gapminder , date: 05/05/2022",
       x="Esp�rence de vie",
       y="Valeurs")+
  theme_bw()+coord_flip()
ggplot(data=base1,mapping =  aes(x = moygdp ,fill=country  )) +
  geom_bar(position = "dodge")+
  scale_fill_manual(values = c("brown","black","red","blue","green","pink"))+
  labs(title = "Valeur moyenne du PIB (gdpPercap) 
       pour les 6 pays",
       subtitle ="             gapminder , date: 05/05/2022",
       x="PIB",
       y="Valeurs")+
  theme_bw()+coord_flip()












#8)Repr�senter les barres dans des fen�tres s�parer (facet_wrap()) en fonction de
#l'une des variables.

ggplot(data=base1,mapping =  aes(x = moylifeExp ,fill=country)) +
  geom_bar(position = "dodge")+
  scale_fill_manual(values = c("brown","black","red","blue","green","pink"))+
  labs(title = "Valeur moyenne de l'�sperence de
  vie (lifeExp) pour les 6 pays",
       subtitle ="             gapminder , date: 05/05/2022",
       x="Esp�rence de vie",
       y="Valeurs")+
  facet_wrap(~moylifeExp)+
  theme_bw()+
  coord_flip()





ggplot(data=base1,mapping =  aes(x = moygdp ,fill=country  )) +
  geom_bar(position = "dodge")+
  scale_fill_manual(values = c("brown","black","red","blue","green","pink"))+
  labs(title = "Valeur moyenne du PIB (gdpPercap)
       pour les 6 pays",
       subtitle ="             gapminder , date: 05/05/2022",
       x="PIB",
       y="Valeurs")+
  facet_wrap(~moygdp)+
  theme_bw()+coord_flip()



#9)Refaire le travail pour les valeurs de l'�cart-type





#pour l'ecart type de la PIB
ggplot(data=base1,mapping =  aes(x = ecartgdp ,fill=country)) +
  geom_bar(position = "dodge")+
  scale_fill_manual(values = c("brown","black","red","blue","green","pink"))+
  labs(title = "Ecart de la PIB (gdpPercap) pour les 6 pays",
       subtitle ="             gapminder , date: 05/05/2022",
       x="PIB",
       y="Valeurs")+
  facet_wrap(~ecartgdp)+
  theme_bw()+
  coord_flip()








#pour l'ecart type de l'esperence de vie


ggplot(data=base1,mapping =  aes(x = ecartLifeExp ,fill=country)) +
  geom_bar(position = "dodge")+
  scale_fill_manual(values = c("brown","black","red","blue","green","pink"))+
  labs(title = "Ecart de l'�sperence de vie (lifeExp)
       pour les 6 pays",
       subtitle ="             gapminder , date: 05/05/2022",
       x="Esp�rence de vie ",
       y="Valeurs")+
  facet_wrap(~ecartLifeExp)+
  theme_bw()+
  coord_flip()
