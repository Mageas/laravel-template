# Laravel Docker Template with Xdebug

This project provides a template for setting up a Laravel application using Docker as the containerization platform and Xdebug for debugging. It simplifies the development environment setup, allowing developers to focus on building their Laravel applications efficiently.

## Features

- **Dockerized Environment**: Easily set up your Laravel application in a Docker container.
- **Xdebug Integration**: Pre-configured Xdebug for debugging your application directly within your IDE.

## Prerequisites

Before you begin, ensure you have installed the following on your system:

- Docker
- Docker Compose

## Getting Started

Follow these steps to get your Dockerized Laravel environment up and running:

1. **Clone the Repository**

   Start by cloning this repository to your local machine.

   ```bash
   git clone https://github.com/Mageas/laravel-template
   ```

2. **Build and Run Docker Containers**

   Navigate to the project directory and run the following command to build and start the Docker containers:

   ```bash
   docker-compose up --build -d
   ```

   This command will start all the necessary containers.

3. **Remove gitkeep**

```sh
rm src/.gitkeep mysql/.gitkeep
```

4. **Create project**

```sh
docker compose run --rm composer create-project laravel/laravel .
```

5. **Access Your Laravel Application**

   Once the containers are up and running, you can access your Laravel application by visiting `http://localhost` in your web browser.

## Artisan commands

```sh
docker compose run --rm artisan migrate
```

## Credits

It is heavely based on https://vshloda.medium.com/setting-up-a-laravel-10-development-environment-with-docker-3977a292c8dd
