#! /bin/sh
mkdir -p SEA/lectures/
make -C ../lectures
find ../lectures/ -name '[0-9]-*.pdf' | xargs -I {} cp {} SEA/lectures/

mkdir -p SEA/labs/
make -C ../labs
find ../labs/ -name '*[0-9].html' | xargs -I {} cp {} SEA/labs/
cp ../labs/pandoc.css SEA/labs/

pandoc -s -S -c pandoc.css syllabus.md -o SEA/index.html
#pandoc -s -S -c pandoc.css projet.md -o SEA/projet.html
rsync -avz SEA/ --delete salusa:/home/poliveira/sifflez.org/www/lectures/SEA/
