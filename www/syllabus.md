---
title: Systèmes d'Exploitation Avancés (SEA) 2018-2019 
---

![](styracosaurus.png "Styracosaurus")

## Informations Administratives

* Site du cours [https://www.sifflez.org/lectures/SEA](https://www.sifflez.org/lectures/SEA)

* Enseignant principal: pablo.oliveira@uvsq.fr
* Chargé de TDs: pablo.oliveira@uvsq.fr

* Groupe de discussion (inscription obligatoire)

    * [google group: iatic4-os](https://groups.google.com/group/iatic4-os/)

    * Sert à poser des questions sur les cours, TDs, projets. Tout le monde est encouragé à répondre !

    * **Attention:** Pour que tout le monde profite des questions/réponses, je
      ne repondrai que aux questions posées sur le groupe de discussion. 
      Les mails avec question envoyés sur une autre adresse; ne recevront pas de réponse. 

* Notation

    * Un contrôle en fin de semestre

    * QCM réguliers en début de cours (au moins deux)

    * Plusieurs mini-projets à rendre

    * Note Finale:
        * 35% Contrôle 
        * 35% Mini-Projet
        * 30% QCM 

Pour tout rendu je vous invite à prendre connaissance de la [charte
anti-plagiat à l'UVSQ](http://www.etu.uvsq.fr/medias/fichier/guide-anti-plagiat-et-charte-nvlogo_1409307925225-pdf).

## Horaire des cours et retards

Les cours commencent à 9h15. Je compte sur votre ponctualité et me réserve le
droit de ne pas admettre en cours les étudiants sans justificatif arrivant en
retard.

## Mini-Projets

Une partie de l'apprentissage en SEA se fait par l'intermédiaire de
mini-projets que vous commencez en TP mais que vous finissez à la maison.  Ces
projets représentent 35% de la note finale. Ils sont une occasion de mettre les
connaissances théoriques apprises en cours en pratique.

## Rendu des TPs et des mini-projets

Le rendu des TDs et des mini-projets se fera en utilisant `git` et en pushant
votre travail sur [le serveur gitlab mis à votre
disposition](http://tahiti.prism.uvsq.fr). Vous avez du recevoir un mail vous
invitant à vous y inscrire.

## Calendrier

* *3 septembre*
    * [**Cours 1: Introduction.**](./lectures/1-introduction.pdf) Qu'est ce qu'un système d'exploitation ?

* *10 septembre*
    * [**Cours 2: Threads et Processus.**](./lectures/2-processus.pdf) Comment partager le CPU entre plusieurs tâches ?
    * [**TD 1**](./labs/T1.html): Mise en place de l'environnement de travail: git / gdb / gcc et rappels de Système 1.

* *17 septembre*
    * **Pas de cours et de TP en présentiel cette semaine**. 
    * Travail en autonomie pour démarrer le [**Mini-Projet 1: Développement d'un shell**](./labs/MP1.html).

* *24 septembre*
    * [**Cours 3: Execution d'un programme.**](./lectures/3-linker.pdf) Comment un programme est chargé et exécuté ?
    * [**TD 2**](./labs/T2.html): Reverse Engineering et exploitation de failles

* *1 octobre*
    * [**Cours 4: Programmation concurrente.**](./lectures/4-concurrence.pdf) Pourquoi et comment synchroniser les tâches ?
    * [**TD 3**](./labs/T3.html): Programmation concurrente

* *8 octobre*
    * [**Cours 5: Ordonnancement.**](./lectures/5-ordo.pdf) Dans quel ordre exécuter les tâches ?
    * [**Mini-Projet 2**](./labs/MP2.html): Implémentation d'un simulateur d'ordonnancement

* **14 octobre avant 23h59, rendu du mini-projet 1 sur votre git**

* *15 octobre* 
    * [**Cours 6: Ordonnancement Temps Réel.**](./lectures/6-ordoTR.pdf) Ordonnancer avec des échéances temporelles.
    * Session de révision (préparez vos questions)

* *22 octobre*
    * [**Cours 7: Mémoire Virtuelle.**](./lectures/7-memvirt.pdf) Comment partager la mémoire entre plusieurs tâches ?
    * [**TD 4**](./labs/T4.html): Exercices sur la mémoire virtuelle (sur feuille)

* *5 novembre*
    * **CC: Contrôle Continu Final**

* **11 novembre avant 23h59, rendu du mini-projet 2 sur votre git** 

## Bibliographie et Ressources

* Operating System Concepts, 8th Edition de Silberschatz, Galvin, and Gagne

* Modern Operating Systems, 4th Edition, de Tanembaum

* [Stanford CS 140 lectures Winter'14 de David Mazières](http://www.scs.stanford.edu/14wi-cs140/)

* Understanding the Linux Kernel 3rd Edition de Bovet, and Cesati

## Sources

Some of the lectures above are translated to french and adapted with some changes from Stanford [CS140 Operating System lectures](http://www.scs.stanford.edu/14wi-cs140/). Thanks to the authors of CS140 lectures for their kind permission to modify and adapt their work.

The sources of the translated lectures and the labs are [available](https://github.com/pablooliveira/SEA). You can modify and redistribute them under the [by-nc-sa-3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/) license.
