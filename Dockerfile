FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y wget gnupg2

# Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -y google-chrome-stable

# Install Selenium and other dependencies
RUN apt-get install -y python3 python3-pip
RUN pip3 install selenium

# Set up your WebDriver tests here (e.g., Python script)

# Expose ports
EXPOSE 4444

# Start your Selenium server
CMD ["java", "-jar", "/path/to/selenium-server-standalone.jar"]
