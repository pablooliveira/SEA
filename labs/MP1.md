---
title: Systèmes d'Exploitation -- Mini-Projet 1
---

Mise en place
-------------

Le but de ce mini-projet est de programmer un shell simple.

Ce mini-projet est à faire sous environnement UNIX en C.
L'utilisation de l'appel `system()` de la stdlib est proscrit, car
cet appel utilise le shell `sh` pour exécuter des commandes.

Votre shell devra utiliser des appels systèmes tel que `open()` ou `fork()`.
Pour obtenir la documentation sur les appels, vous pouvez utiliser la commande:

```bash
   $ man 2 <commande>
```

Le 2 fait référence à la section 2 du manuel qui catalogue les fonctions système.

Utilisation de Git
------------------

Pour tous les Mini-Projets (MPs) de système on
utilisera [git](http://git-scm.com). Vous avez vu son utilisation et configuré
un dépôt dans le [TP1](T1.html).

Allez dans votre dépôt git et créez un nouvel répertoire pour travailler sur le MP1:

```bash
    $ cd prenom-nom/
    # Créez maintenant un répertoire MP1
    $ mkdir MP1/
    $ cd MP1/
```

Faites maintenant le MP normalement. Vous travaillerez sur le répertoire ```MP1``` que vous
venez de créer. À chaque question vous *committerez* vos modifications.

Pour envoyer votre travail sur le serveur de rendu (en fin de séance), vous utiliserez la commande:

```bash
    $ git push origin master
```

Makefile et nom du binaire
--------------------------

Pour compiler votre shell, le script de correction automatique utilisera les commandes suivantes:

```bash
   $ cd MP1/
   $ make
```

Pour executer votre shell, le script de correction automatique utilisera la commande suivante:

```bash
   $ cd MP1/
   $ ./mishell
```

Assurez vous donc de commiter un `Makefile` qui fabrique un binaire appellé `mishell` (comme mini shell). Le `Makefile` ne doit pas lancer le shell ou d'autres programmes.

Assurez vous que le shell est robuste. Idéalement testez le sur une machine qui n'est pas votre machine habituelle, par exemple en vous connectant sur un des serveurs Linux de l'ISTY.

Suivez scrupuleusement les instructions (ne changez pas les spécifications du TP), en effet vos shells sont testés de manière automatique. 

Vérifiez également que votre shell supporte des chemins longs. Vous pouvez faire l'hypothèse que la taille maximale d'un chemin est 4096 caractères.

Notation
--------

Ce MP sera noté. Le rendu se fera en pushant sur votre dépôt SEA sur le git.

Trois critères seront utilisés pour la notation:

* Correction du code: votre code sera évalué sur des exemples (comme
  les exemple donnés dans le sujet).

* Code clair: votre code est clair, indenté et intelligemment commenté

* Utilisation de git: un commit par exercice, messages clairs et informatifs

Un shell simple
---------------

Le shell est un programme qui permet à l'utilisateur de lancer des programmes
de manière interactive. Des exemples de shell courants sont bash, ksh, tcsh,
fish, zsh.

Commitez sous git à la fin de chaque question.

(@) Programmez l'interface textuelle de votre shell.
    Votre shell doit présenter un invite à l'utilisateur (obligatoirement terminé par `%`)
    puis lire l'entrée de l'utilisateur.
    Pour l'instant, contentez vous d'imprimer le texte que l'utilisateur
    à entré.
    Vous pouvez utiliser les fonctions: `printf` et `fgets` par exemple.
    Lorsque l'utilisateur tape `CTRL+D` (soit EOF) en début d'invite le
    programme doit quitter.

    Exemple d'execution:

```bash
        % cd
        cd
        % ls
        ls
        %
```


(@) Programmez un parseur simple qui décompose l'entrée de l'utilisateur
    en tokens. Les tokens sont les mots de l'entrée qui sont séparés par
    des espaces ou des tabulations.
    Par exemple, l'entrée `ls ../.. | sort` est composée des 4 tokens suivants:
    `ls`, `../..`, `|`, et `sort`.

    À ce stade-ci votre shell doit juste imprimer la liste des tokens à chaque entrée.
    Vous pouvez utiliser la fonction `strsep` pour cela.

    Exemple d'execution:

```bash
        % ls ..
        ls
        ..
        % cd
        cd
        %
```


(@) Implémentez deux primitives du shell:
    * Si l'utilisateur tape `exit`, le shell doit sortir.
    * Si l'utilisateur tape `cd <arg>`, le shell doit changer son
      répertoire courant selon <arg>.
    * Modifiez également le shell pour qu'il affiche le répertoire
      courant avant l'invite.

    Vous pouvez utiliser les fonctions `strcmp`, `getcwd` et `chdir`.

    Exemple d'utilisation:

```bash
        /home/toto % cd ..
        /home/ % exit
```


(@) Implémentez l'exécution de commandes simples.
    Sauf si `cd` ou `exit` sont reconnus, le shell suppose que l'utilisateur
    à tapé une commande à exécuter.
    Implémentez l'execution de commandes sans vous servir de la fonction `system`.
    Vous pouvez utiliser `fork`, `execvp` et `waitpid`.

    Exemple d'utilisation:

```bash
        /home/toto % ls -a
        . .. documents
        /home/toto % cat /etc/passwd
        root:x:0:0:root:/root:/bin/bash
        daemon:x:1:1:daemon:/usr/sbin:/bin/sh
        bin:x:2:2:bin:/bin:/bin/sh
        sys:x:3:3:sys:/dev:/bin/sh
        ...
```


Fonctionnalités avancées
------------------------

(@) Implémentez la redirection d'entrées sorties standard. Votre shell
    doit reconnaître les redirections suivantes: `>`, `<` et `2>`.

    Vous pouvez utiliser les fonctions `dup2`, `open` et `close`.

    Exemple d'utilisation:

``` bash
        /home/toto % ls -a > out
        /home/toto % cat out
        .
        ..
        documents
        out
        /home/toto % sort -r < out
        out
        documents
        ..
        .
```


(@) Implémentez les pipes.
    Vous pouvez utiliser la fonction `pipe`.
    Votre code ne doit pas faire l'hypothèse d'un nombre de pipes maximal.

    Exemple d'utilisation:

```bash
        /home/toto % ls -a | sort -r | grep o
        out
        documents
        /home/toto % sort -r < out | grep o > out2
        /home/toto % cat out2
        out
        documents
```


(@) Implémentez la mise en tâche de fond, opérateur `&`.

    Exemple d'utilisation:

```bash
        /home/toto % sleep 5 &
        /home/toto % echo hi
        hi
```

(@) SECRET LEVEL: Implémentez une/des fonctionnalité(s) de votre choix (attention
    pour débloquer ce niveau il faut avoir répondu à toutes les autres questions
    avant). Quelques suggestions: complétion automatique avec TAB, job control
    (bg et fg), gestion des variables d'environnement, amélioration du parseur
    pour prendre en compte les guillemets, sous-shells `$()`.

![Secret Level](mario.jpg)
