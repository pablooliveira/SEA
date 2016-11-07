% Systèmes d'Exploitation II
% Ordonnancement
% Pablo de Oliveira

# Caractéristiques des Processus

## Alternance E/S et Calcul

* La plupart des programmes alternent entre:
  * des phases de calcul (utilisation du CPU)
  * des phases d'Entrée/Sortie (attente des données)

* Quelle est la longueur moyenne d'une phase de calcul ?

## Distribution des phases de calcul (CPU Burst)

\centering
\includegraphics[height=0.6\textheight]{img/burst_distribution}

* Loi exponentielle
* Phases de CPU longues sont rares
  * Correspondent à du calcul sans aucune sortie sur disque, ou d'entrée utilisateur.

## Classification des processus

* __CPU-bound__ (Limité par le Calcul)
    * processus gourmand en CPU, phases CPU longues
* __IO-bound__ (Limité par les E/S)
    * le processus passe son temps à attendre les E/S
* __Intéractif__
    * phases CPU courtes, puis phases E/S très longues (attente de l'utilisateur)

## Exemple CPU-Bound vs IO-Bound

\centering
\includegraphics[height=0.6\textheight]{img/burst_img}

# Ordonnancement

## Architecture mono-cœur ou multi-cœur

   * Ordonnancement sur un processeur:

    * Plusieurs tâches s'exécutent sur un seul processeur. Un ordonnanceur,
        passe d'une tâche à l'autre pour simuler une execution concurrente.

   * Ordonnancement sur multi-processeur:

    * Plusieurs tâches s'exécutent sur plusieurs processeurs, en parallèle.


## Problème

   * Quel est le meilleur ordonnanceur ?


## Objectifs

* Point de vue Système:
    * Maximiser utilisation CPU
    * Maximiser le débit (nombre de tâches complétées par unité de temps)

* Point de vue Utilisateur:
    * Minimiser la latence:
        * Temps de complétion d'une tâche (durée entre l'arrivée d'une tâche et sa complétion)
        * Temps de réponse (durée entre l'arrivée d'une tâche et le début de son exécution)
    * Minimiser l'attente (durée passée à attendre)

## Ordonnanceur Préemptif

* Un ordonnanceur __Non-Préemtif__ n'interrompt jamais une tâche qu'il a commencé.
* Un ordonnanceur __Préemtif__ peut interrompre une tâche trop longue, ou bloquée,
pour exécuter une autre tâche.

## Ordonnancement FCFS

* Premier arrivé premier servi
* Non Préemptif

## FCFS: Exemple d'ordonnancement

* Tâches $\tau_1$ à $\tau_5$
* Activation $A_i$: 0, 2, 4, 6, 8
* Durée $D_i$: 3, 6, 4, 5, 2

\begin{center}
\begin{RTGrid}[width=6cm]{5}{20}
\TaskArrival{1}{0}
\TaskExecution{1}{0}{3}
\TaskArrival{2}{2}
\TaskExecution{2}{3}{9}
\TaskArrival{3}{4}
\TaskExecution{3}{9}{13}
\TaskArrival{4}{6}
\TaskExecution{4}{13}{18}
\TaskArrival{5}{8}
\TaskExecution{5}{18}{20}
\end{RTGrid}

\end{center}

## FCFS: Métriques

\begin{center}

\begin{RTGrid}[width=6cm]{5}{20}
\TaskArrival{1}{0}
\TaskExecution{1}{0}{3}
\TaskArrival{2}{2}
\TaskExecution{2}{3}{9}
\TaskArrival{3}{4}
\TaskExecution{3}{9}{13}
\TaskArrival{4}{6}
\TaskExecution{4}{13}{18}
\TaskArrival{5}{8}
\TaskExecution{5}{18}{20}
\end{RTGrid}

\end{center}

* Utilisation CPU: 100% et Débit: $\frac{5}{20} = 0.25$
* Complétion (total): $(3-0)+(9-2)+(13-4)+(18-6)+(20-8) = 43$
* Réponse/Attente (total): $23$ (non-préemtif réponse = attente)

## FCFS: Analyse

* Avantages:
    * Simple à implémenter
* Désavantages:
    * Effet de "convoi": les jobs courts attendent beaucoup derrière un gros job
    * Performance est très variable selon l'ordre des tâches

## Effet de convoi: illustration

\begin{center}

\begin{RTGrid}[width=6cm]{3}{20}
\TaskArrival{1}{0}
\TaskExecution{1}{0}{2}
\TaskArrival{2}{2}
\TaskExecution{2}{2}{4}
\TaskArrival{3}{4}
\TaskExecution{3}{4}{20}
\end{RTGrid}

\begin{RTGrid}[width=6cm]{3}{20}
\TaskArrival{1}{0}
\TaskExecution{1}{0}{16}
\TaskArrival{2}{2}
\TaskExecution{2}{16}{18}
\TaskArrival{3}{4}
\TaskExecution{3}{18}{20}
\end{RTGrid}

\end{center}


## SJF Shortest Job First (Plus court job d'abord)

### SJF est optimal pour réduire le temps d'attente

* On suppose que l'on exécute les processus dans l'ordre $1,2, \dots, k$
* Soient les durées d'exécution $p_1, p_2, \dots, p_k$
* Alors le temps d'attente total est:
$$ 0 + p1 + (p_1 + p_2) + (p_1+p_2+p_3) + \dots = (k-1).p_1 + (k-2).p_2 + \dots + p_k $$

* Pour diminuer le temps d'attente, il faut exécuter d'abord les jobs les plus courts

## SJF: deux versions

* Non préemptive: un job n'est pas interrompu
* Préemptive: Shortest-Remaining-Time-First (SRTF)
    * si un job arrive qui est plus court que le temps restant du processus courant, on préempte.

## SJF: Exemple d'ordonnancement

* Version non-préemptive

\begin{center}

\begin{RTGrid}[width=6cm]{5}{20}
\TaskArrival{1}{0}
\TaskArrival{2}{2}
\TaskArrival{3}{4}
\TaskArrival{4}{6}
\TaskArrival{5}{8}

\TaskExecution{1}{0}{3}
\TaskExecution{2}{3}{9}
\TaskExecution{5}{9}{11}
\TaskExecution{3}{11}{15}
\TaskExecution{4}{15}{20}
\end{RTGrid}

\end{center}

* Complétion (total): $38$
* Attente (total): $18$
* Réponse (total): $18$

## SRTF: Exemple d'ordonnancement

* Version préemptive

\begin{center}

\begin{RTGrid}[width=6cm]{5}{20}
\TaskArrival{1}{0}
\TaskArrival{2}{2}
\TaskArrival{3}{4}
\TaskArrival{4}{6}
\TaskArrival{5}{8}

\TaskExecution{1}{0}{3}
\TaskExecution{2}{3}{4}
\TaskExecution{3}{4}{8}
\TaskExecution{5}{8}{10}
\TaskExecution{2}{10}{15}
\TaskExecution{4}{15}{20}
\end{RTGrid}

\end{center}

* Complétion (total): $36$
* Attente (total): $16$
* Réponse (total): $10$

## SJF/SRTF: Analyse

* Avantages:
    * Optimal pour le temps d'attente moyen
* Désavantages:
    * Difficile à estimer la durée d'un processus
    * Famine: si beaucoup de jobs courts, les jobs longs ne s'exécutent jamais

## SJF: Comment estimer le temps d'un processus ?

* Hypothèse: sur une courte fenêtre de temps, la distribution des durées est
  proche. Utiliser le passé pour prédire l'avenir.
* Moyenne exponentielle: $prediction_{i+1} = \alpha.duree_i + (1 - \alpha).prediction_i$

\centering
\includegraphics[height=0.7\textheight]{img/burst_prediction}

## Ordonnancement Round-Robin

* Ordonnancement en Tourniquet
* On définit un quantum $q$
* Changement de processus:
    * Si un processus est plus long que $q$ il est préempté
    * Si un processus attend une entrée il est préempté

## RR: Intéressant pour contrôler le temps de réponse


* Avec $n$ processus
    * Chaque processus utilise (environ) $\frac{1}{n}$ du temps CPU
    * Chaque exécution dure au maximum $q$ unités de temps
    * Aucun processus n'attends sans réponse plus de $(n-1)q$ unités de temps

## Exemple d'ordonnancement (q=1)

* Tâches $\tau_1$ à $\tau_5$
* Activation $A_i$: 0, 2, 4, 6, 8
* Durée $D_i$: 3, 6, 4, 5, 2

\begin{center}

\begin{RTGrid}[width=6cm]{5}{20}
\TaskArrival{1}{0}
\TaskArrival{2}{2}
\TaskArrival{3}{4}
\TaskArrival{4}{6}
\TaskArrival{5}{8}

\TaskExecution{1}{0}{2}
\TaskExecution{1}{3}{4}
\TaskExecution{2}{2}{3}
\TaskExecution{2}{4}{5}
\TaskExecution{3}{5}{6}
\TaskExecution{2}{6}{7}
\TaskExecution{4}{7}{8}
\TaskExecution{3}{8}{9}
\TaskExecution{2}{9}{10}
\TaskExecution{5}{10}{11}
\TaskExecution{4}{11}{12}
\TaskExecution{3}{12}{13}
\TaskExecution{2}{13}{14}
\TaskExecution{5}{14}{15}
\TaskExecution{4}{15}{16}
\TaskExecution{3}{16}{17}
\TaskExecution{2}{17}{18}
\TaskExecution{4}{18}{20}
\end{RTGrid}

\end{center}

## RR: Métriques

\begin{center}

\begin{RTGrid}[width=6cm]{5}{20}
\TaskArrival{1}{0}
\TaskArrival{2}{2}
\TaskArrival{3}{4}
\TaskArrival{4}{6}
\TaskArrival{5}{8}

\TaskExecution{1}{0}{2}
\TaskExecution{1}{3}{4}
\TaskExecution{2}{2}{3}
\TaskExecution{2}{4}{5}
\TaskExecution{3}{5}{6}
\TaskExecution{2}{6}{7}
\TaskExecution{4}{7}{8}
\TaskExecution{3}{8}{9}
\TaskExecution{2}{9}{10}
\TaskExecution{5}{10}{11}
\TaskExecution{4}{11}{12}
\TaskExecution{3}{12}{13}
\TaskExecution{2}{13}{14}
\TaskExecution{5}{14}{15}
\TaskExecution{4}{15}{16}
\TaskExecution{3}{16}{17}
\TaskExecution{2}{17}{18}
\TaskExecution{4}{18}{20}
\end{RTGrid}

\end{center}

* Complétion (total): $54$
* Réponse (total): $4$
* Attente (total): $34$

## RR: Analyse

* Avantages:
    * Intéressant pour les jobs courts
    * Équitable
    * Moins variable que FCFS

* Désavantages:
    * Pour les jobs longs, le coût de changement de contexte est problématique

## RR: Comment choisir $q$?

* Trop grand: RR dégénère en FCFS, mauvais pour les jobs courts
* Trop petit: coût de changement de contexte pénalise les jobs longs

* À chaque préemption, on paye le coût de changement de contexte $c$.
    * Il faut choisir $q$ de 10 à 100 fois plus grand que $c$
    * En pratique aujourd'hui:
        * $q$ est entre 10ms et 100ms
        * $c$ est entre 0.1ms et 1ms



## Ordonnancement Multi-niveaux

* Difficile d'estimer le temps d'un processus.
    * Ordonnanceur adaptatif
* On considère plusieurs priorités.
    * Le processus prêt de plus haute priorité est toujours choisi.
    * Au début tous les processus ont la priorité max.
    * Chaque processus à un quota d'exécution $q$

## Multi-niveaux: Analyse

* Stratégie:
    * Si un processus dépasse un quota $q$, il est préempté et sa priorité est réduite
    * Si un processus bloque avant $q$, sa priorité est augmentée

* Résultat:
    * Les processus très courts (IO-bound) se retrouvent avec des priorités élevées
    * Les processus longs (CPU-bound) se retrouvent avec des priorités faibles

* Famine:
    * Pour éviter la famine, les processus "vieux" reçoivent un bonus de priorité

## Et dans Linux ?

* Linux 1.2: Round-Robin
* Linux 2.2: Introduit des priorités
* Linux 2.4: Semblable à un ordonnancement Multi-Niveaux en $O(n)$
* Linux 2.6: Multi-Niveaux en $O(1)$
* Linux 2.6.21: CFS (Completely Fair Scheduler), équilibre le temps alloué à chaque tâche en utilisant un RB-Tree
(http://www.ibm.com/developerworks/library/l-completely-fair-scheduler/)

## Et le multi-coeur ?

* Problème complexe, recherche en cours.
* Quelques problèmes intéressants:
    * Affinité: mettre les tâches qui communiquent sur le même processeur
    * Équilibrage de charge: répartir les tâches équitablement entre les processeurs
    * Migration: coûteuse entre deux processeurs différents

## Résumé

* SJF et SRTF optimaux pour le temps d'attente
    * Mais difficile de prédire le temps d'un processus

* RR équitable
    * Intéressant pour les processus interactifs
    * Peu de variabilité entre processus

* FCFS simple a implémenter
    * Performance très variable, effet de convoi

* Multi-Niveaux
     Efficace pour gérer aussi bien des jobs CPU et IO-bound
