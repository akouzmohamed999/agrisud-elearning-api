Getting Started
=================

First of all, this documentation is YOUR documentation :
* Anyone can create/modify/delete anything if you think that it is not the right place or if it is outdated
* Don't worry about loosing things, this documentation is gitted, we will always find things back.
* We use English for the sake of the technic
* 1 Sentence per line (for easiest merge)

Tools
----------

The tools that you'll need for developping on this project are :
(we'll fix the version of them if they aren't compatible anymore. In the meantime, please use the last existing version)
  * **Git** : https://git-scm.com/
  * **Java 16**
  * **Maven** : https://maven.apache.org/
  * **Docker** : https://maven.docker.com/
    * windows professional or above: 
        - download and install "docker for windows"
    * windows home or lower:
        - download and install "docker toolbox"
    * linux:
        - download and install "docker.io" & "docker-compose"
  * **Docker-compose** : (if you are using linux)
  * Your favorite IDE. If you don't have any idea :
     * **Intellij** : https://www.jetbrains.com/idea/ (please buy a valid licence, or use community version, or use EAP version)
     * **Eclipse** : https://www.eclipse.org/downloads/eclipse-packages/ (latest version is recommended to support JDK 11)
        * *Recommended plugins* :
            * For correct handling of SpringBoot apps : **Spring Tool Suite** : http://marketplace.eclipse.org/content/spring-tool-suite-sts-eclipse
            * For easier project browsing outside the IDE : **EasyShell** : http://marketplace.eclipse.org/content/easyshell
            * For coverage analysis : **EclEmma** : http://marketplace.eclipse.org/content/eclemma-java-code-coverage
            * For (partial) .editorconfig integration : **editorconfig-eclipse** : http://marketplace.eclipse.org/content/editorconfig-eclipse
            * (*beware, NOT RECOMMENDED over VSCode, only try it if you dare experience an unfinished Eclipse plugin*) For Angular2 integration : **Angular2 Eclipse** : http://marketplace.eclipse.org/content/angular2-eclipse
     * You also need to install **Lombok** on your IDE (by double-clicking on Lombok Maven JAR dependency).

Starting dev environment
-------------------------
To start your dev environment, you need to follow these steps: 

 * **Docker containers** :
    * gateway needs these containers to be running to function properly:
        - mysql
        - keycloak
        
once you have cloned the gateway project, go to the **root folder** and run the command **docker-compose up -d**

* **Mysql**
    *  once your mysql database container is running, you can access either from included cloudBeaver client [http://localhost:3300](http://localhost:3300) and setup connection with the mysql container, or a client of your choice.
* **Keycloak**
    *  to access keycloak and manage authentication/authorization, use (admin/admin) in [http://localhost:3800](http://localhost:3300).    

Starting gateway server
-------------------------
wait for all containers to start then start gateway server by running in the root folder:

    mvn clean install:  (to clean existing build folder and install a new version of gateway server)
    mvn spring_boot:run :  (to run the new installed version)

Git 
----------

#### Format of the commit message:
```bash
<type>(<scope>): <subject>
```

#### Example commit message:

```bash
fix(header): fixing responsive behaviour
```

##### Allowed `<type>` values:

* **feat** (new feature for the user, not a new feature for build script)
* **fix** (bug fix for the user, not a fix to a build script)
* **docs** (changes to the documentation)
* **style** (formatting, missing semi colons, etc; no production code change)
* **refactor** (refactoring production code, eg. renaming a variable)
* **test** (adding missing tests, refactoring tests; no production code change)
* **chore** (updating grunt tasks etc; no production code change)

Additional information
----------------------

* **Bootstrapped Users :**

| Username      | password      | roles |
| ------------- |:-------------:|:-------------:|
|admin | admin | admin |
|user | user | user |

