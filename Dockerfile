# Используем официальный образ Maven
FROM maven:3.8.4-jdk-11 AS build

# Копируем исходный код проекта в контейнер
COPY . /usr/src/app

# Задаем рабочую директорию
WORKDIR /usr/src/app

# Собираем проект с помощью Maven
RUN mvn clean install

# Используем образ с JRE для запуска приложения
FROM openjdk:11-jre-slim

# Копируем собранные файлы из контейнера с Maven в контейнер с JRE
COPY --from=build /usr/src/app/target/*.jar /app.jar

# Указываем команду для запуска приложения при старте контейнера
CMD ["java", "-jar", "/app.jar"]
