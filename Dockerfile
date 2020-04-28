FROM centos:latest

RUN yum -y install glibc-locale-source && localedef -f UTF-8 -i en_US en_US.UTF-8
ENV LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en" \
    LC_ALL="en_US.UTF-8"

RUN yum -y update && yum clean all && yum -y install epel-release && yum install -y python3-pip git vim sudo
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install ansible
RUN python3 -m pip install netapp-lib solidfire-sdk-python pysphere

#RUN mkdir /root/ansible-devel \
#    && cd /root/ansible-devel \
#    && git clone https://github.com/ansible/ansible.git /root/ansible-devel \
#    && cp -aRv /root/ansible-devel/lib/ansible/module_utils/netapp* /usr/local/lib/python3.6/site-packages/ansible/module_utils \
#    && cp -aRv /root/ansible-devel/lib/ansible/modules/storage/netapp/* /usr/local/lib/python3.6/site-packages/ansible/modules/storage/netapp/

RUN python3 -m pip install ansible --upgrade

RUN groupadd ansible
RUN useradd --create-home --shell /bin/bash -g ansible -G wheel ansible
RUN echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ansible

CMD ["/bin/bash"]