# Используем базовый образ Maven
FROM maven:latest

# Установить переменные среды (если необходимо)

# Копировать файлы проекта в контейнер
COPY . /usr/src/myapp

# Указать рабочую директорию
WORKDIR /usr/src/myapp

# Установить зависимости Maven и собрать проект
RUN mvn dependency:resolve
RUN mvn install

# Опционально: Указать точку входа для запуска приложения
# ENTRYPOINT ["java", "-jar", "target/myapp.jar"]
