Le logiciel doit être déployé dans le monde entier avec un haut niveau de disponibilité. La manière la plus simple de remplir ces critères est de passer par un hébergeur de type cloud, chez un prestataire qui dispose de datacenters dans toutes les régions du monde. 
On pourrait comparer les offres de différents prestataires pour trouver celui qui offre les meilleures performances pour l'Afrique, qui est la région où se trouvent la majorité des utilisateurs de l'application, mais pour l'exercice, on va prendre l'exemple d'Azure.

Azure App Services est un service Azure qui permet de déployer des applications dans le cloud. Ce service a une SLA de 99,95 % ce qui est suffisant pour les besoins de notre application.

Pour la base de données, on peut choisir une base de données Azure SQL Database qui prend en charge PostgresSQL et offre une SLA pouvant aller jusqu'à 99.99%.

On pourra également utiliser Azure Files pour la gestion de fichiers.

## Estimation des CPU et RAM nécessaires : 
Durée moyenne d’une requête : 4 secondes en moyenne.
Pointes de trafic : Jusqu'à 500 requêtes par seconde pendant les heures de pointe.
CPU et RAM (API et Backend) : 0,25 vCPU et 128 Mo de RAM par requête

En 4 secondes : 2000 requêtes en heure de pointe => 500vCPU et 256 Go de RAM

Ces données nous permettront de dimensionner correctectement Azure App Services et d'estimer plus facilement les coûts.

## Estimation du volume de stockage nécessaire pour les données :
Stockage de logs : 50 Go par jour.
Base de données : 100 Go de données de projet avec une croissance estimée à 10% par mois.
Stockage de fichier : 100To avec une croissance de 5% par mois

On peut répliquer la base de données dans plusieurs datacenters pour qu'elle reste accessible même en cas de défaillance serveur ou de désastre datacenter.

On passera par Azure pour mettre en place une stratégie de backups adaptée (backups automatiques et réguliers, réplication des backups dans plusieurs datacenters, éventuellement architecture hot/cold pour limiter les coûts)

## Risques
Si les performances de l'application sont trop mauvaises, l'entreprise pourra envisager de mettre en place un cloud hybride, en combinant les services Azure avec les services d'un autre prestataire cloud, ou en déployant ses propres datacenters au plus proche de ses clients.


