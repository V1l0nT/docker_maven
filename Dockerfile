# Используем базовый образ Maven
FROM maven:latest

# Копировать файлы проекта в контейнер
COPY . /usr/src/myapp

# Указать рабочую директорию
WORKDIR /usr/src/myapp

# Установить зависимости Maven и собрать проект
RUN mvn dependency:resolve
RUN mvn install

# ENTRYPOINT ["java", "-jar", "target/myapp.jar"]
