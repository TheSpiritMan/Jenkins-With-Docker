# <b>Jenkins With Docker</b>
- For <b>CI/CD</b>, most of the time we used Jenkins in a docker container. But something we have to build docker images inside jenkins container and push it to the Registry whether that is public Registry like <b>DockerHub</b> or private registry hosted in <b>Nexus Repository</b>.
- This image cab be found in [DockerHub](https://hub.docker.com/r/thespiritman/jenkins-with-docker). 

## <b>Architecture</b>
- We have install docker inside this official jenkins image.
- We are not using <b>Docker-In-Docker</b>. Rather, we are sharing same <b>docker socket</b> inside the jenkins container.
- That means, the container running <b>inside</b> the jenkins container and the <b>jenkins container itself</b> have a sibling relationship rather not a child parent relationship.

- <b>Root Password:</b> root
- <b> Jenkins Password:</b> jenkins

### <b>Command to run this image:</b>
```
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v jenkins_home:/var/jenkins_home thespiritman/jenkins-with-docker:latest
```
- `/var/run/docker.sock:/var/run/docker.sock`: sharing docker socket
- `jenkins_home:/var/jenkins_home`: is for jenkins data

# <b>Remember: </b> This image is running as a root user, so only use this image is local development system.