#!/bin/bash

echo Please enter project details
echo ============================
echo

read -p "groupId: " groupId
read -p "artifactId: " artifactId
read -p "Packaging (jar, pom, war): " packaging
read -p "Java Version (1.7, 1.8, 11, 12, 13): " javaVersion

echo G $groupId A $artifactId

echo Preparing POM

sed -i "s/##groupId/$groupId/g" pom.xml
sed -i "s/##artifactId/$artifactId/g" pom.xml
sed -i "s/##packaging/$packaging/g" pom.xml
sed -i "s/##javaVersion/$javaVersion/g" pom.xml

echo Making Directories

mkdir -p src/main/java/${groupId//./\/}
mkdir -p src/main/resources/
mkdir -p src/test/java/${groupId//./\/}
mkdir -p src/test/resources/

echo Making App.java

sed "s/##groupId/$groupId/g" app.java.t > src/main/java/${groupId//./\/}/App.java
sed -i "s/##artifactId/$artifactId/g" src/main/java/${groupId//./\/}/App.java

read -p "Clean up? (y/n)" cleanUp

if [ "$cleanUp" = "y" ]; then
rm app.java.t
rm -Rf .git
rm start.sh
echo cleaning up..
fi

echo Done.
