<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>##groupId</groupId>
  <artifactId>##artifactId</artifactId>
  <packaging>pom</packaging>
  <version>1.0-SNAPSHOT</version>

  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <maven.compiler.source>##javaVersion</maven.compiler.source>
    <maven.compiler.target>##javaVersion</maven.compiler.target>
  </properties>

  <modules>
    <module>##artifactId-model</module>
    <module>##artifactId-service</module>
    <module>##artifactId-core</module>
  </modules>

  <build>
    <pluginManagement>
      <plugins>
        <plugin>
          <groupId>org.sonarsource.scanner.maven</groupId>
          <artifactId>sonar-maven-plugin</artifactId>
          <version>3.6.0.1398</version>
        </plugin>
        <plugin>
          <groupId>org.jacoco</groupId>
          <artifactId>jacoco-maven-plugin</artifactId>
          <version>0.8.3</version>
        </plugin>
        
      </plugins>
    </pluginManagement>
  </build>
</project>
