Opensource MERN stack CRUD operations 

**Containerized the source code with docker.**

Docker Containerization

Multi-stage Docker Build used to reduce image size by over 60%.

Stage 1:

Used a rich base image: ubuntu:latest.

Installed Node.js 18.

Created an alias for ease of use.

Defined the working directory using WORKDIR.

Installed dependencies and copied source code.

Stage 2:

Switched to a lightweight image: node:alpine.

Defined working directory.

Copied the necessary files and dependencies from the first stage.

Exposed ports 3000 (backend) and 4200 (frontend) for external access.

Used CMD to define the container's startup command.

**docker-compose**

docker-compose is used to link two or more containers like LAMP (Linux, Apache2, Mysql, Php) architecture.

Pulled the backend image from Docker Hub:

pavan1309/mern-app, built using a custom multi-stage Dockerfile.

Container Setup:

  Named the container: api
  
  Set working directory to /app
  
  Defined the startup command using CMD
  
  Used port mapping to expose the internal application port to the host
  
  Environment Configuration:
  
    Passed MongoDB connection details using environment variables
    
Service Dependency:

    Used Docker Compose’s depends_on to establish dependency on the MongoDB database container, ensuring the DB starts before the backend.

**This setup mirrors the frontend container approach for consistency and maintainability.**

**GITHUB WORKFLOW**
Implemented Continuous Integration (CI) using GitHub Actions. Here's a breakdown of the steps and tools used:
1) actions/checkout@v4
    Clones the source code from the GitHub repository into the runner.
2) docker/setup-buildx-action@v3
    Enables advanced image builds with Docker Buildx.
    Advantages:
     Faster and more efficient builds using BuildKit.
     Safe secret management during builds.
     Allows for reusable and isolated builders (better for multi-platform builds).
3) docker/login-action@v3
    Logs into Docker Hub securely using GitHub Secrets.
4) aquasecurity/trivy-action@master
    Scans the Docker image for known vulnerabilities and CVEs using Aqua Trivy.
5) actions/upload-artifact@v4
    Uploads build files, logs, or reports as artifacts.
    These can be downloaded or shared with other jobs via actions/download-artifact@v4.

**Secret Management**
Used Secrets and variable to store Docker hub Credentials


