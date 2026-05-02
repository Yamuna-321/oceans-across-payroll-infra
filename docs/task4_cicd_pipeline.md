# Task 4 — CI/CD Pipeline

## Features
- Runs on push to main
- Docker build and test
- Multi-service matrix builds
- EC2 deployment via SSH
- Dev and production environments
- GitHub Secrets for secure config
- No hardcoded credentials
- Team-independent deployment structure

## Team Isolation
Separate services:
- frontend
- backend
- AI
- tenant services

Each can deploy independently via matrix strategy.
