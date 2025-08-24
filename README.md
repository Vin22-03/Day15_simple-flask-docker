# 🌩️ Full DevOps CI/CD Deployment on AWS (AutoDeploy-AWS: Jenkins x Docker x ECS)


## 👋 Hiii, I’m Vinay!

I built this project as part of my **#30Days30Projects30Learnings #VinCloudOps** challenge — with no prior IT background.  
I struggled. I debugged. I broke things. And I fixed them.

Today, this Flask app is deployed from GitHub → Jenkins → Docker → AWS using real-world DevOps tools.  
It’s more than a project — it’s a **milestone**. 💪

---

## 🚀 What I Built

A fully automated CI/CD pipeline that:

- Clones source code from **GitHub**
- Builds Docker image using **Jenkins**
- Pushes it to **AWS ECR**
- Provisions ECS Infra using **Terraform**
- Deploys the container to **AWS ECS Fargate**
- Shows a beautiful live webpage with tech stack & branding

---

## 🛠️ Tech Stack

| Tool           | Purpose                              |
|----------------|--------------------------------------|
| ⚙️ Jenkins      | CI/CD automation                    |
| 🐳 Docker       | Containerization                    |
| 🌿 Terraform    | Infrastructure as Code (IaC)        |
| 📦 AWS ECR      | Docker image repository             |
| 🧱 AWS ECS      | Container deployment service        |
| 🚀 Flask        | Python web framework (the app)     |
|    GitHub       | Version Control                     |
---

## 💻 Live App

🟢 **Deployed at:**  
`http://34.201.165.56:5000`


---

## 🧪 How It Works (CI/CD Pipeline)

```plaintext
1. Push code to GitHub
2. Jenkins auto-triggers build
3. Docker image is built + pushed to ECR
4. ECS Fargate pulls new image
5. ECS service is updated (via Jenkins pipeline)
6. App is live with latest code!
```

## 🧠 What I Learned
```
- Debugging AWS ECS and Jenkins

- Dealing with ngrok webhooks, ECS task defs, image tags

- Writing pipeline scripts, IAM policies, and Docker builds

- The satisfaction of seeing my app live... after breaking it 20 times 😅
```


## 💼 Connect With Me

- GitHub: [Vin22-03](https://github.com/Vin22-03)

- LinkedIn: www.linkedin.com/in/vinayvbhajantri

- DevOps Portfolio: Coming soon on (www.vincloudops.tech)

## 🌟 Final Words

"I didn’t come from tech. But I’m building tech now."
Every terraform apply, every docker push, and every failed Jenkins build taught me something.

# If I can do it — so can you.

🛑 Don’t forget to leave a ⭐ if this repo inspires you
🟢 Built with sweat, dreams, and DevOps 💚
