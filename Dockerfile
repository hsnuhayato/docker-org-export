FROM thomasweise/docker-texlive-full

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get update && \
    apt-get install -y emacs python-seqdiag graphviz default-jre plantuml gnuplot

ENV DEBIAN_FRONTEND noninteractive
ADD install.el /emacs/install.el
ADD emacs_init.el /emacs/emacs_init.el
WORKDIR /emacs
ENV HOME /emacs
RUN wget http://jaist.dl.sourceforge.net/project/plantuml/plantuml.jar
RUN emacs --batch --load install.el
ADD export.el /emacs/export.el
ADD ob-blockdiag.el /emacs/ob-blockdiag.el
ADD .blockdiagrc /emacs/.blockdiagrc
ADD LiberationSans-Regular.ttf /emacs/LiberationSans-Regular.ttf

