#!/bin/bash

echo Please enter the project details
echo ============================
echo

read -p "groupId: " groupId
read -p "artifactId: " artifactId
read -p "Base model: " baseModel
read -p "Java Version (1.7, 1.8, 11, 12, 13): " javaVersion

if [[ -z $groupId || -z $artifactId || -z $baseModel ]]; then
    echo "Please enter project details next time..."
    echo "exiting.."
    exit 1
fi

if [[ -z $javaVersion ]]; then
    javaVersion="1.8"
fi

# Parent Pom
sed "s/##groupId/$groupId/g" pom.xml.t >pom.xml
sed -i "s/##artifactId/$artifactId/g" pom.xml
sed -i "s/##packaging/$packaging/g" pom.xml
sed -i "s/##javaVersion/$javaVersion/g" pom.xml

# Model Module
mkdir -p $artifactId-model/src/main/java/${groupId//./\/}/model
mkdir -p $artifactId-model/src/test/java/${groupId//./\/}/model
mkdir -p $artifactId-model/src/test/resources/
mkdir -p $artifactId-model/src/main/resources/
mkdir -p $artifactId-model/src/test/java/${groupId//./\/}

sed "s/##groupId/$groupId/g" model.java.t >$artifactId-model/src/main/java/${groupId//./\/}/model/"${baseModel}Model.java"
sed -i "s/##baseModel/$baseModel/g" $artifactId-model/src/main/java/${groupId//./\/}/model/"${baseModel}Model.java"

sed "s/##groupId/$groupId/g" model-pom.xml.t >$artifactId-model/pom.xml
sed -i "s/##artifactId/$artifactId/g" $artifactId-model/pom.xml

# Service Module
mkdir -p $artifactId-service/src/main/java/${groupId//./\/}/service
mkdir -p $artifactId-service/src/main/java/${groupId//./\/}/service/consumer
mkdir -p $artifactId-service/src/main/java/${groupId//./\/}/service/configuration
mkdir -p $artifactId-service/src/test/java/${groupId//./\/}/service
mkdir -p $artifactId-service/src/test/resources/
mkdir -p $artifactId-service/src/main/resources/
mkdir -p $artifactId-service/src/test/java/${groupId//./\/}

sed "s/##groupId/$groupId/g" service.java.t >$artifactId-service/src/main/java/${groupId//./\/}/service/"${baseModel}Service.java"
sed -i "s/##baseModel/$baseModel/g" $artifactId-service/src/main/java/${groupId//./\/}/service/"${baseModel}Service.java"

sed "s/##groupId/$groupId/g" consumer.java.t >$artifactId-service/src/main/java/${groupId//./\/}/service/consumer/"${baseModel}RestConsumer.java"
sed -i "s/##baseModel/$baseModel/g" $artifactId-service/src/main/java/${groupId//./\/}/service/consumer/"${baseModel}RestConsumer.java"

sed "s/##groupId/$groupId/g" configuration.java.t >$artifactId-service/src/main/java/${groupId//./\/}/service/configuration/"${baseModel}Configuration.java"
sed -i "s/##baseModel/$baseModel/g" $artifactId-service/src/main/java/${groupId//./\/}/service/configuration/"${baseModel}Configuration.java"

sed "s/##groupId/$groupId/g" service-pom.xml.t >$artifactId-service/pom.xml
sed -i "s/##artifactId/$artifactId/g" $artifactId-service/pom.xml

# Core Module
mkdir -p $artifactId-core/src/main/java/${groupId//./\/}/core/controller
mkdir -p $artifactId-core/src/main/java/${groupId//./\/}/core/logic
mkdir -p $artifactId-core/src/main/java/${groupId//./\/}/core/persister
mkdir -p $artifactId-core/src/main/java/${groupId//./\/}/core/persister/repository
mkdir -p $artifactId-core/src/main/java/${groupId//./\/}/core/entity
mkdir -p $artifactId-core/src/main/java/${groupId//./\/}/core/transformer
mkdir -p $artifactId-core/src/test/java/${groupId//./\/}
mkdir -p $artifactId-core/src/test/resources/
mkdir -p $artifactId-core/src/main/resources/
mkdir -p $artifactId-core/src/test/java/${groupId//./\/}

sed "s/##groupId/$groupId/g" application.java.t >$artifactId-core/src/main/java/${groupId//./\/}/core/Application.java
sed "s/##groupId/$groupId/g" controller.java.t >$artifactId-core/src/main/java/${groupId//./\/}/core/controller/"${baseModel}Controller.java"
sed -i "s/##artifactId/$artifactId/g" $artifactId-core/src/main/java/${groupId//./\/}/core/controller/"${baseModel}Controller.java"
sed -i "s/##baseModel/$baseModel/g" $artifactId-core/src/main/java/${groupId//./\/}/core/controller/"${baseModel}Controller.java"

sed "s/##groupId/$groupId/g" logic.java.t >$artifactId-core/src/main/java/${groupId//./\/}/core/logic/"${baseModel}Logic.java"
sed -i "s/##artifactId/$artifactId/g" $artifactId-core/src/main/java/${groupId//./\/}/core/logic/"${baseModel}Logic.java"
sed -i "s/##baseModel/$baseModel/g" $artifactId-core/src/main/java/${groupId//./\/}/core/logic/"${baseModel}Logic.java"

sed "s/##groupId/$groupId/g" entity.java.t >$artifactId-core/src/main/java/${groupId//./\/}/core/entity/"${baseModel}Entity.java"
sed -i "s/##baseModel/$baseModel/g" $artifactId-core/src/main/java/${groupId//./\/}/core/entity/"${baseModel}Entity.java"

sed "s/##groupId/$groupId/g" persister.java.t >$artifactId-core/src/main/java/${groupId//./\/}/core/persister/"${baseModel}Persister.java"
sed -i "s/##artifactId/$artifactId/g" $artifactId-core/src/main/java/${groupId//./\/}/core/persister/"${baseModel}Persister.java"
sed -i "s/##baseModel/$baseModel/g" $artifactId-core/src/main/java/${groupId//./\/}/core/persister/"${baseModel}Persister.java"

sed "s/##groupId/$groupId/g" repository.java.t >$artifactId-core/src/main/java/${groupId//./\/}/core/persister/repository/"${baseModel}Repository.java"
sed -i "s/##baseModel/$baseModel/g" $artifactId-core/src/main/java/${groupId//./\/}/core/persister/repository/"${baseModel}Repository.java"

sed "s/##groupId/$groupId/g" transformer.java.t >$artifactId-core/src/main/java/${groupId//./\/}/core/transformer/"${baseModel}Transformer.java"
sed -i "s/##baseModel/$baseModel/g" $artifactId-core/src/main/java/${groupId//./\/}/core/transformer/"${baseModel}Transformer.java"

sed "s/##groupId/$groupId/g" core-pom.xml.t >$artifactId-core/pom.xml
sed -i "s/##artifactId/$artifactId/g" $artifactId-core/pom.xml

sed "s/##groupId/$groupId/g" kubernetes.t >$artifactId-core/kubernetes
sed -i "s/##artifactId/$artifactId/g" $artifactId-core/kubernetes
sed -i "s/##baseModel/$baseModel/g" $artifactId-core/kubernetes

cp dockerfile.t $artifactId-core/Dockerfile
cp application.yml.t $artifactId-core/src/main/resources/application.yml

#Clean Up
read -p "Clean up? (y/n)" cleanUp

if [ "$cleanUp" = "y" ]; then    
    echo cleaning up..
    rm *.t    
    rm -Rf .git
    rm start.sh
fi

echo Done.
