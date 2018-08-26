FROM jupyter/base-notebook

ENV CONDA_DIR=/opt/conda \
    SHELL=/bin/bash \
    NB_USER=jovyan \
    NB_UID=1000 \
    NB_GID=100 \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
ENV PATH=$CONDA_DIR/bin:$PATH \
    HOME=/home/$NB_USER

USER root

RUN apt-get update && apt-get install -y apache2 telnet libapache2-mod-php vim git gcc && \
    rm -rf /var/lib/apt/lists/* ; \
    npm install express ; \
    conda install -y -c conda-forge networkx ; \
    echo 'ServerName 127.0.0.1' >> /etc/apache2/apache2.conf ; \
    echo 'Listen 8080' >> /etc/apache2/apache2.conf

RUN conda config --add channels conda-forge ; \
    conda install -y -c rigetti pyquil; \
    conda install -y -c conda-forge py-solc numpy networkx antlr4; \
    cd /home/$NB_USER/; \
    git clone --depth=1 https://github.com/ethereum/web3.py.git web3 && cd web3; \
    python setup.py install ; \
    cd .. ; \
    git clone --depth=1 https://github.com/ethereum/py-solc.git && cd py-solc ; \
    python setup.py install;



COPY . /home/$NB_USER/
COPY pyquil_config /home/$NB_USER/.pyquil_config
COPY ./start_demo.sh /home/$NB_USER/

CMD ["/home/$NB_USER/start_demo.sh"]
