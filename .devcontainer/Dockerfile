FROM nvcr.io/nvidia/pytorch:24.03-py3

# Configure Microsoft package repository
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb; dpkg -i packages-microsoft-prod.deb; rm packages-microsoft-prod.deb
# Install tmux, htop, and blobfuse2
RUN apt update; apt install tmux htop libfuse3-dev fuse3 blobfuse2 -y
# Install azcopy
RUN wget https://aka.ms/downloadazcopy-v10-linux -O /root/azcopy.tar; tar xzf /root/azcopy.tar -C /root; rm /root/azcopy.tar; mv /root/azcopy_linux_amd64_*/azcopy /usr/bin/azcopy; rm -rf /root/azcopy_linux_amd64_*
RUN cd /root; wget https://aka.ms/downloadazcopy-v10-linux; 
# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash; apt clean
# Install our packages
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt