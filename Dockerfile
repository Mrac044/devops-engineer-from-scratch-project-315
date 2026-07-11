# --- ЭТАП 1: Сборка приложения ---
FROM eclipse-temurin:21-jdk-jammy AS builder

WORKDIR /app

# 1. Копируем файлы сборщика gradle wrapper
COPY gradlew ./
COPY gradle ./gradle

# 2. ИСПРАВЛЕНО: Копируем конфигурационные файлы Kotlin DSL (.kts) и версии
COPY build.gradle.kts settings.gradle.kts versions.properties ./

# 3. Скачиваем зависимости (кешируем их)
RUN ./gradlew dependencies --no-daemon || true

# 4. Копируем исходный код
COPY src ./src

# 5. Собираем проект
RUN ./gradlew build --no-daemon

# --- ЭТАП 2: Финальный минимальный образ ---
FROM eclipse-temurin:21-jre-jammy

WORKDIR /app

# Копируем собранный jar-файл
COPY --from=builder /app/build/libs/*.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]