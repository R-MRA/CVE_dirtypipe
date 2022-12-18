FROM ubuntu:18.04



# Install tools and create local user
RUN apt-get update && \
    apt-get -y install gcc && \
    rm -rf /var/lib/apt/lists/*


# Add attacker user with password sword
RUN useradd -ms /bin/bash attacker
RUN echo 'attacker:sword' | chpasswd


# Import files
WORKDIR /home/attacker
COPY compile.sh .
COPY exploit-1.c .
# COPY exploit-2.c .
RUN chown attacker.attacker exploit* compile*

# Login as attacker
USER attacker