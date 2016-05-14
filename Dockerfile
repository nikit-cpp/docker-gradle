FROM java:8-jdk
MAINTAINER Nikita Konev <nikit.cpp@yandex.ru>

# Gradle
ENV GRADLE_VERSION 2.13
ENV GRADLE_SHA 0f665ec6a5a67865faf7ba0d825afb19c26705ea0597cec80dd191b0f2cbb664

RUN cd /usr/lib \
 && curl -fl https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o gradle-bin.zip \
 && echo "$GRADLE_SHA gradle-bin.zip" | sha256sum -c - \
 && unzip "gradle-bin.zip" \
 && rm "gradle-bin.zip"

# Set Appropriate Environmental Variables
ENV GRADLE_HOME /usr/lib/gradle-${GRADLE_VERSION}
ENV PATH $PATH:$GRADLE_HOME/bin

# Volumes
VOLUME ["/root/.gradle", "/usr/bin/app"]

# Default command is "/usr/bin/gradle -version" on /usr/bin/app dir
WORKDIR /usr/bin/app
ENTRYPOINT ["gradle"]
CMD ["-version"]
