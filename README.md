# Getting Started
* Run `./service.sh stop && ./service.sh start`. This will run docker commands under the hood to start all Artifactory related services
* Open [http://localhost:9000/artifactory](http://localhost:9000/artifactory) and login with `admin` and `password`
* Follow the walk through to set up repositories and new login credentials

# Usage
The repository comes with a simple `build.gradle` file with all the necessary configuration to be able to deploy artifacts to the locally running
Artifactory instance. Simply replace the publishing section with the repository you are going to deploy to and the admin credentials created 
during `Getting Started`:
```groovy
    maven {
      url 'http://localhost:9000/artifactory/<repo-name>'
      credentials {
        username 'admin'
        password '<admin-password>'
      }
    }
```
