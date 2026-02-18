---
title: Systèmes d'Exploitation Avancés (SEA) 2024-2025
---

![](styracosaurus.png "Styracosaurus")

## Informations Administratives

* Enseignants: pablo.oliveira@uvsq.fr, jgurhem@aneo.fr

* Notation

    * Mini-projets à rendre
    * Un contrôle en fin de semestre

    * Note Finale:
        * 60% Contrôle
        * 40% Mini-Projet

Pour tout rendu je vous invite à prendre connaissance de la [charte
anti-plagiat à l'UVSQ](https://www.uvsq.fr/medias/fichier/charte-anti-plagiat-v20210825_1633613607876-pdf?ID_FICHE=144644&INLINE=FALSE)

## Horaire des cours et retards

Je compte sur votre ponctualité, merci d'arriver quelques minutes avant le début du cours.

## Mini-Projets

Une partie de l'apprentissage en SEA se fait par l'intermédiaire d'un
mini-projet que vous commencez en TP mais que vous finissez à la maison.  C'est
une occasion de mettre les connaissances théoriques apprises en cours en
pratique.

## Rendu des TPs et du mini-projet

Le rendu des TDs et du mini-projet se fera en utilisant `git` et en pushant
votre travail sur [le serveur gitlab mis à votre
disposition](http://gitlab-chps.ens.uvsq.fr).

## Syllabus

* séance 1
    * [**Cours 1: Introduction.**](./lectures/1-introduction.pdf) Qu'est ce qu'un système d'exploitation ?

* séance 2
    * [**Cours 2: Threads et Processus.**](./lectures/2-processus.pdf) Comment partager le CPU entre plusieurs tâches ?
    * [**TD 1**](./labs/T1.html): Mise en place de l'environnement de travail: git / gdb / gcc et rappels de Système 1.
    * Travail en autonomie pour démarrer le [**Mini-Projet 1: Développement d'un shell**](./labs/MP1.html).

* *séance 3*
    * [**Cours 3: Execution d'un programme.**](./lectures/3-linker.pdf) Comment un programme est chargé et exécuté ?
    * [**TD 2**](./labs/T2.html): Reverse Engineering et exploitation de failles

* *séance 4*
    * [**Cours 4: Programmation concurrente.**](./lectures/4-concurrence.pdf) Pourquoi et comment synchroniser les tâches ?
    * [**TD 3**](./labs/T3.html): Programmation concurrente

* *séance 5*
    * [**Cours 5: Ordonnancement.**](./lectures/5-ordo.pdf) Dans quel ordre exécuter les tâches ?
    * (optionnel) [**Cours 6: Ordonnancement Temps Réel.**](./lectures/6-ordoTR.pdf) Ordonnancer avec des échéances temporelles.
    * [**TD 4**](./labs/T5.html): Implémentation d'un simulateur d'ordonnancement

* *séance 6*
    * **Cours 6: Introduction au cloud computing** (slides envoyés par Jérôme Gurhem)

* *séance 7*
    * [**Cours 7: Mémoire Virtuelle.**](./lectures/7-memvirt.pdf) Comment partager la mémoire entre plusieurs tâches ?
    * [**TD 5**](./labs/T5.html): Exercices sur la mémoire virtuelle

## Bibliographie et Ressources

* Operating System Concepts, 8th Edition de Silberschatz, Galvin, and Gagne

* Modern Operating Systems, 4th Edition, de Tanembaum

* [Stanford CS 140 lectures Winter'14 de David Mazières](http://www.scs.stanford.edu/14wi-cs140/)

* Understanding the Linux Kernel 3rd Edition de Bovet, and Cesati

## Sources

Some of the lectures above are translated to french and adapted with some changes from Stanford [CS140 Operating System lectures](http://www.scs.stanford.edu/14wi-cs140/). Thanks to the authors of CS140 lectures for their kind permission to modify and adapt their work.

The sources of the translated lectures and the labs are [available](https://github.com/pablooliveira/SEA). You can modify and redistribute them under the [by-nc-sa-3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/) license.
