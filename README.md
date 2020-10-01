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
and specify which file you want to deploy in this section:
```
artifact file("<path-to-file-you-want-to-publish")
```

Once done, you can run `./gradlew publish` to publish the artifact to the specified repo in artifactory. You can go back to the UI and find the repository with
(hopefully) your artifact deployed

# Troubleshooting
* Make sure there's no conflicting services running on port 9000
* Make sure to remove `data` directory if having trouble logging in. It's probably persisting your login credentials from last time
