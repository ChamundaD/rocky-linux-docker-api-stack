# 🚀 Rocky Linux Docker API Stack

A full-stack backend project built on **Rocky Linux 9 (RHEL-compatible)** using **Docker** to orchestrate a containerized PostgreSQL database, a Flask-based REST API, and a web-based GUI for container management via **Portainer**. Designed for development, DevOps learning, and portfolio demonstration, this stack simulates real-world enterprise backend architecture.

---

## 📦 Tech Stack

- **OS**: Rocky Linux 9 (VirtualBox VM)
- **Containers**: Docker, Portainer
- **Database**: PostgreSQL (Dockerized)
- **Backend**: Python 3 + Flask + psycopg2
- **Management Tools**: DBeaver (GUI client), Portainer (Web UI)

---

## 📁 Project Structure

```
rocky-linux-docker-api-stack/
├── flask-api/
│   ├── app.py              # Flask API source
│   ├── Dockerfile          # Flask container image definition
│   └── requirements.txt    # Python dependencies
├── db/
│   └── create_schema.sql   # PostgreSQL schema (users, messages)
├── docker/
│   └── portainer-setup.sh  # Shell script to launch Portainer
└── README.md
```

---

## 🔧 Setup Instructions

### 1. Start PostgreSQL container
```bash
docker run --name pgdb \
  -e POSTGRES_PASSWORD=mysecurepass \
  -e POSTGRES_DB=testdb \
  -p 5432:5432 \
  -d postgres
```

### 2. Build & run the Flask API container
```bash
cd flask-api
docker build -t flask-api .
docker run --name flask-api --network="host" -d -p 5000:5000 flask-api
```

### 3. Apply database schema
```bash
psql -h localhost -U postgres -d testdb -f db/create_schema.sql
```

### 4. Launch Portainer (Docker GUI)
```bash
docker volume create portainer_data
docker run -d -p 9000:9000 --name=portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce
```

---

## 🔌 API Endpoints

| Method | Endpoint           | Description                     |
|--------|--------------------|---------------------------------|
| GET    | `/users`           | List all users                  |
| POST   | `/users`           | Create a new user (JSON body)   |
| GET    | `/messages/<id>`   | Get messages by user ID         |

---

## 🧠 Skills Demonstrated

- Linux system administration
- Docker & containerization
- PostgreSQL database modeling
- Flask API development
- RESTful API integration with SQL
- GUI management with Portainer and DBeaver

---

## 🖼️ Screenshots

> *(Add screenshots of the Flask API running, Portainer dashboard, and DBeaver view here)*

![Portainer Dashboard](screenshots/portainer.png)
![DBeaver SQL View](screenshots/dbeaver.png)
![Flask API Response](screenshots/flask-api.png)

---

## 👤 Author

**Kapil Ramjattan**  
Cybersecurity Analyst | Data Analyst | Business Analyst | MS in Compliance Law (In Progress)  
📫 [LinkedIn](https://www.linkedin.com) | [GitHub](https://github.com)

---

## 📄 License

This project is licensed under the MIT License - see the `LICENSE` file for details.
