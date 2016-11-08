Systèmes d'Exploitation: Mini-Projet 1
======================================

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

Pour tous les TPs de système on utilisera [git](http://git-scm.com).
Si vous travaillez sur romuald commencez par rajouter git dans votre $PATH,

```bash
    $ export PATH=/users/ens/pabdeoli/bin/:$PATH
```


Utilisez le dépôt du TP1:

```bash
    $ cd tps-ase/
    # Créez maintenant un répertoire TP2
    $ mkdir TP2/
    $ cd TP2/
```

Faites maintenant le TP normalement. Vous travaillerez sur le répertoire ```TP2``` que vous
venez de créer. À chaque question vous *committerez* vos modifications.

Pour envoyer votre travail sur le serveur de rendu (en fin de séance), suivez les étapes ci-dessous:

```bash
    $ git remote add central ssh://gitolite@tahiti.prism.uvsq.fr/prenom_nom

    $ git push -u central master
    Counting objects: 3, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (2/2), done.
    Writing objects: 100% (3/3), 230 bytes, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To ssh://gitolite@tahiti.prism.uvsq.fr/prenom_nom
     * [new branch]      master -> master
    Branch master set up to track remote branch master from central.
```

Notation
--------

Ce TP sera fait sur deux séances et noté.

Trois critères seront utilisés pour la notation:

* Correction du code (70%): votre code sera évalué sur des exemples (comme
  les exemple donnés dans le sujet).

* Code clair (15%): votre code est clair, indenté et intelligemment commenté

* Utilisation de git (15%): un commit par exercice, messages clairs et informatifs

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
