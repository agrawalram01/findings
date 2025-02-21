# tomcat/Dockerfile
FROM tomcat:9.0-jre11-temurin

#RUN groupadd -r tomcat && useradd -r -g tomcat tomcat

# Remove default webapps
#RUN rm -rf /usr/local/tomcat/webapps/*

# Create webapps directory
#RUN mkdir -p /usr/local/tomcat/webapps

#COPY ROOT.war /usr/local/tomcat/webapps/
RUN cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/

# Create a test index.html in ROOT
RUN echo '<html><body><h1>Welcome to Tomcat</h1></body></html>' > /usr/local/tomcat/webapps/ROOT/index.html

# Copy sample web.xml if needed
#COPY web.xml /usr/local/tomcat/conf/

# Create a sample index.html if no WAR file is available
#RUN echo '<html><body><h1>Tomcat is running!</h1></body></html>' > /usr/local/tomcat/webapps/ROOT.html

# Optional: Add custom server configuration
#COPY server.xml /usr/local/tomcat/conf/

# Set permissions
#RUN chown -R tomcat:tomcat /usr/local/tomcat

EXPOSE 8080
