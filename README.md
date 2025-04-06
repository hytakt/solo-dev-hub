# README

SoloDevHub

SoloDevHub is a community platform designed for solo learners of web development and programming. Whether you're studying alone, from a non-technical background, or just looking for peers to stay motivated with, this platform is for you.

✨ Motivation

Many aspiring developers study alone without guidance or peers to consult. SoloDevHub exists to fill that gap, providing a space to:

Share learning experiences and questions

Connect with other solo learners

Keep motivation up through peer interaction

Support each other on the programming journey

🎓 Target Audience

Self-taught web developers

Students from non-technical or humanities backgrounds

Beginners learning programming alone

People who struggle with motivation due to lack of community

🚀 Features (MVP - Minimum Viable Product)

Post short updates/questions like a mini blog or tweet

Comment on posts to encourage/support/answer

View timeline of latest posts from the community

Sign up / log in with email

Optional tags for posts (e.g., #Ruby, #HTML, #Motivation)

⚙️ Tech Stack

Backend: Ruby on Rails 7.1

Database: PostgreSQL (Dockerized)

Frontend: HTML / CSS (will integrate simple styling)

Containerization: Docker + Docker Compose

🌄 Getting Started

Prerequisites

Docker & Docker Compose

Git

Setup

git clone https://github.com/hytakt/solo-dev-hub.git
cd solo-dev-hub
docker compose build
docker compose up -d

Visit: http://localhost:13000

Create the Database

docker compose exec web bin/rails db:create db:migrate

✉️ Contributing

This project is in early development. Suggestions, ideas, and feedback are welcome!

If you're learning solo too, you're more than welcome to:

Submit issues for bugs or ideas

Fork and PR features or improvements

Share your learning story with us!

❤️ Author

GitHub: @hytakt

🚧 License

MIT

Let's build a place where solo developers don't have to feel alone.

Welcome to SoloDevHub.


