FROM quay.io/ruiztulio/oml7:master
RUN cd /home/odoo/instance/odoo && git pull \
    && git checkout 16a969214fd1c468b5a2df6ac4624e588c3e5b35
RUN cd /home/odoo/instance/extra_addons/addons_vauxoo  && bzr pull -r1130
RUN cd /home/odoo/instance/extra_addons/oml  && git pull \
    && git checkout 0afbfe22a4a830212a3e7b65a6bff3c2a1f861e4

ADD files/odoo.conf /home/odoo/instance/config/

USER root
ADD files/odoo.conf /external_files/odoo.conf
ENTRYPOINT ["/entry_point.py"]