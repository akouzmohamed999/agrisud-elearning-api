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

Starting gateway server
-------------------------
wait for all containers to start then start gateway server by running in the root folder:

    mvn clean install:  (to clean existing build folder and install a new version of gateway server)
    mvn spring_boot:run :  (to run the new installed version)

Git Workflow
----------

Now that a first release has been delivered to client, we need to keep track of multiple version in a same time.
So we need to use a more complexe workflow than developping on master : git flow

### Git Flow

You'll find a good cheat sheet and a tool that can help you (git-flow) :  https://danielkummer.github.io/git-flow-cheatsheet/

But, the basics are :
 * Master contains the release delivered to Client
 * Develop contains the fully developed features and fixes (this branch is deployed on the integration platform)
 * When you start developing a new feature, you should create a new branch from **develop** named "feature/<my_feature>" (please use relevant names for <my_feature>)
 * When you start fixing anomalies on a released version, you should create a new branch from **master** named "hotfix/<my_fix>" (please use relevant names for <my_fix>)
 * When you start fixing anomalies on a developed (non-released version), you should update the corresponding feature branch
 * When we are ready to release a new version, a corresponding branch names "release/<my_version>" should be created (please use relevant names for <my_version>)
 * When you are done developing a **feature**, it should be merged on the develop branch
 * When you are done developing a single **fix**, hotfix branch can be merge on the develop branch
 * When we are done developing all the fixes, hotfix branch can me merged on the develop branch **and** the master branch
 * When we are done developing all the feature, a release can be started
 * When we are done developing the release, the release can be delivered

#### Format of the commit message:
```bash
<type>(<scope>): <subject>

<body>

<footer>
```

#### Example commit message:

```bash
fix(connexion): change dynamic after a valid login

... whatever you've done

Fixes #2310
```

#### Message subject (first line)
The first line should simply describe what have been done, the second line is always blank and
other lines are optional for us (but the more detail it has, the better it is). The type and scope should
always be lowercase as shown below.

##### Allowed `<type>` values:

* **feat** (new feature for the user, not a new feature for build script)
* **fix** (bug fix for the user, not a fix to a build script)
* **docs** (changes to the documentation)
* **style** (formatting, missing semi colons, etc; no production code change)
* **refactor** (refactoring production code, eg. renaming a variable)
* **test** (adding missing tests, refactoring tests; no production code change)
* **chore** (updating grunt tasks etc; no production code change)

Definition Of Done
------------------

I can change the status of my functionality/issue to "done" when :

* I have checked that every rules and scenarios are implemented and validated
* I have checked that it is working on different browsers (Firefox and Chrome at least, but IE11/12 and Edge also have to work, and this is especially critical for IHM input components)
* I have removed every temporary debug log :
  * client side output on console (but can be cleanly commented if useful for future dev)
  * server side unclean debug log and useless for future devs (and usefull clean debug log should also have proper **debug** level to be deactivated)
* I have checked that no error is shown in the JavaScript console (F12) while using my functionnality
* I have cleaned useless imports (also in unit tests)
* I have pushed the code for Jenkins to build it, it built it, and it's green !
* I have tested that my functionality is working on the integration platform, it is available for fonctionnal testing purpose (with necessary referential datas)
* I updated the documentation if necessary
* I am keeping track of changes which will require special update procedure for next delivery, and will provide information when that delivery is being produced

While waiting for Build/Sonar/Deploy, I perform a code review on the code that I don't know : I discuss wierd code on rocket (#afb-dev)


Additional information
----------------------

* **Bootstrapped Users :**

| Username      | password      | roles |
| ------------- |:-------------:|:-------------:|
|admin | admin | admin |
|user | user | user |

