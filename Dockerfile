FROM centos:latest

RUN yum -y update && yum clean all && yum -y install epel-release && yum install -y python-pip git vim sudo
RUN pip install --upgrade pip
RUN pip install ansible
RUN pip install netapp-lib solidfire-sdk-python pysphere

RUN mkdir /root/ansible-devel \
    && cd /root/ansible-devel \
    && git clone https://github.com/ansible/ansible.git /root/ansible-devel \
    && cp -aRv /root/ansible-devel/lib/ansible/module_utils/netapp* /usr/lib/python2.7/site-packages/ansible/module_utils \
    && cp -aRv /root/ansible-devel/lib/ansible/modules/storage/netapp/* /usr/lib/python2.7/site-packages/ansible/modules/storage/netapp/

RUN pip install ansible --upgrade

RUN groupadd ansible
RUN useradd --create-home --shell /bin/bash -g ansible -G wheel ansible
RUN echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ansible

CMD ["/bin/bash"]