FROM tomcat:10.1-jdk21

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    maven

# Set environment variables
ENV JAVA_HOME=/opt/java/openjdk
ENV PATH=$PATH:$JAVA_HOME/bin

# Expose ports
# Tomcat
EXPOSE 8080

# Start services
CMD catalina.sh run



FROM jenkins/jenkins:2.430-jdk21

# Switch to root user
USER root

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    maven

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Switch back to jenkins user
USER jenkins
