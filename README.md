# 🚀 GCP DevSecOps Lab

A hands-on **DevSecOps + GitOps lab** built locally to understand how CI/CD, container security, private registries, GitOps, and Kubernetes work together.

This is **Phase 1** of the project. The entire environment was built and tested locally without using GCP.

## 🏗️ Architecture

```text
Git
 ↓
GitHub
 ↓
GitHub Actions
 ↓
Docker Build
 ↓
Trivy Security Scan
 ↓
Private GHCR
 ↓
Argo CD
 ↓
Kubernetes (kind)
 ↓
Application
🛠️ What I Built
Containerized the application using Docker + NGINX
Created a local Kubernetes cluster using kind
Deployed the application using Kubernetes Deployment + Service
Built CI using GitHub Actions
Added Trivy container vulnerability scanning
Published Docker images to a private GitHub Container Registry (GHCR)
Configured Kubernetes authentication for private image pulls
Used immutable Git commit SHA image tags
Connected Argo CD to GitHub for GitOps-based deployment
Enabled automated synchronization and reconciliation
🔐 Security

Security was integrated into the delivery pipeline rather than treated as a separate step.

Container Security
Trivy vulnerability scanning
Immutable image tags using Git commit SHA
Avoided using latest for deployments
Registry Security
Private GHCR repository
Authenticated Kubernetes image pulls
Dedicated read-only package access for pulling images
GitOps Security
Kubernetes manifests maintained in Git
Git used as the desired state
Argo CD continuously reconciles the cluster with Git
🧠 Key Learning

One of the biggest lessons from this project was understanding the relationship between container images and GitOps.

Initially, using:

image: application:latest

did not trigger the expected deployment behavior.

The key realization was:

A new image in a registry does not automatically mean a new desired state in Git.

Switching to an immutable Git commit SHA image tag made the deployment change explicit.

Git Change
    ↓
Argo CD Detects Change
    ↓
Reconciliation
    ↓
Kubernetes Rollout
    ↓
New Pods
    ↓
Updated Application
🐛 Troubleshooting

During the project, I worked through several real-world issues:

Argo CD ApplicationSet CRD installation issue
Private GHCR image pull authentication
GitHub Actions Trivy action version issue
Understanding why latest did not result in the expected GitOps update
Moving to immutable image tags using Git commit SHA

These issues were an important part of the learning process.

📂 Repository Structure
.
├── .github/
│   └── workflows/
│
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
│
├── argocd-application.yaml
├── Dockerfile
└── README.md
💻 Local Environment

The project was built and tested locally using:

Docker
Kubernetes
kind
kubectl
Argo CD
GitHub Actions
GitHub Container Registry
Trivy

🎯 Goal

The goal of this project is to gain practical experience by building, breaking, troubleshooting, and securing the complete application delivery workflow.

👨‍💻 Author

Arhavinth

Cloud Infrastructure & Security | GCP | DevSecOps | Cloud Security
