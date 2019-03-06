pipeline {

    agent {
        label master
    }

    tools {

        maven "Maven 3.6.0"
    }

    environment {
        //This can be nexus3 or nexus2
        NEXUS_VERSION = "nexus3"
        //This can be http or https
        NEXUS_PROTOCOL = "http"
        //Where your nexus is running
        NEXUS_URL = "http://127.0.0.1:8081"
        NEXUS_REPOSIOTORY = "testing"
        NEXUS_CREDENTIAL_ID = "nexus-credentials"
    }

    stages {
        stage ("clone code") {
            steps {
                script {
                    git "https://github.com/muheric/git-test.git"
                }
            }
        }
        stage("mvn build"){
            sh "mvn package -DskipTests=true"
        }

        stage ("publish to nexus"){
            steps {
                script {
                    pom = readMavenPom file: "pom.xml"
                    filesByGlob = findFiles (glob: "target/*.${pom.packaging}");
                    echo "${filesByGlob[0].name} ${filesByGlob[0].path} ${filesByGlob[0].directory} ${filesByGlob[0].length} ${filesByGlob[0].lastModified}"
                    artifactPath = filesByGlob[0].path;
                    artifactExists = fileExists artifactPath;
                    if(artifactExists) {
                        echo "*** File: ${artifactPath}, group: ${pom.groupId}, packaging: ${pom.packaging}, version ${pom.version}";
                        nexusArtifactUploader(
                            nexusVersion: NEXUS_VERSION,
                            protocol: NEXUS_PROTOCOL,
                            nexusUrl: NEXUS_URL,
                            groupId: pom.groupId,
                            version: pom.version,
                            repository: NEXUS_REPOSITORY,
                            credentialsId: NEXUS_CREDENTIAL_ID,
                            artifacts: [
                                // Artifact generated such as .jar, .ear and .war files.
                                [artifactId: pom.artifactId,
                                classifier: '',
                                file: artifactPath,
                                type: pom.packaging],
                                // Lets upload the pom.xml file for additional information for Transitive dependencies
                                [artifactId: pom.artifactId,
                                classifier: '',
                                file: "pom.xml",
                                type: "pom"]
                            ]
                        );

                    } else {
                        error "*** File: ${artifactPath}, could not be found";
                    }
                }
            }

        }
    }


}