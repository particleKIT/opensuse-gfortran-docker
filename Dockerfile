FROM opensuse/leap:latest
MAINTAINER particle-admin@lists.kit.edu

RUN zypper --gpg-auto-import-keys --non-interactive ref && \
    zypper --gpg-auto-import-keys --non-interactive up

RUN zypper --non-interactive in --auto-agree-with-licenses \
    automake make libtool \
    gcc gcc-fortran gcc-c++ \
    binutils-gold \
    gsl gsl-devel \
    openmpi openmpi-devel Modules \
    python3-pytest which \
    LHAPDF-devel libLHAPDF python-LHAPDF python3-LHAPDF python3-pyOpenSSL \
    fastjet-devel libfastjet0 fastjet-plugin-siscone fastjet-plugin-siscone-devel \
    texlive-latex texlive-collection-mathscience texlive-collection-latexextra \
    git gzip wget

RUN lhapdf update && lhapdf install cteq6l1 CT10nlo CT14nlo
# workaround until lhapdf fixed their hepforge page
#RUN cd /usr/share/LHAPDF/ && \
#    wget https://lhapdf.hepforge.org/downloads?f=pdfsets/current/cteq6l1.tar.gz -O- | tar xz && \
#    wget https://lhapdf.hepforge.org/downloads?f=pdfsets/current/CT10nlo.tar.gz -O- | tar xz && \
#    wget https://lhapdf.hepforge.org/downloads?f=pdfsets/current/CT14nlo.tar.gz -O- | tar xz
