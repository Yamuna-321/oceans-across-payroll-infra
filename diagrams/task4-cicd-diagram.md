# Task 4 — GitHub Actions CI/CD Pipeline Diagram

```mermaid
graph TB

    Devs[Frontend / Backend / AI Teams]
    GitHubRepo[GitHub Repository]
    Actions[GitHub Actions Pipeline]

    subgraph Build[Build & Test Stage]
        DockerCompanies[Build Companies Docker Image]
        DockerBureaus[Build Bureaus Docker Image]
        DockerEmployees[Build Employees Docker Image]
        Tests[Placeholder Tests]
    end

    subgraph DeployDev[Development Deployment]
        DevEC2[Dev EC2 Deployment]
    end

    subgraph DeployProd[Production Deployment]
        ProdEC2[Production EC2 Deployment]
    end

    Secrets[GitHub Secrets]
    SSH[SSH / SSM Secure Deployment]

    Devs --> GitHubRepo
    GitHubRepo --> Actions

    Actions --> DockerCompanies
    Actions --> DockerBureaus
    Actions --> DockerEmployees

    DockerCompanies --> Tests
    DockerBureaus --> Tests
    DockerEmployees --> Tests

    Tests --> DevEC2
    DevEC2 --> ProdEC2

    Secrets --> Actions
    Actions --> SSH

    SSH --> DevEC2
    SSH --> ProdEC2
