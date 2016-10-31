FROM opensuse:42.1
MAINTAINER robin.roth@kit.edu

RUN zypper --gpg-auto-import-keys --non-interactive ref && \
    zypper --gpg-auto-import-keys --non-interactive up

RUN zypper --non-interactive in --auto-agree-with-licenses \
    automake make libtool gcc gcc-fortran gcc-c++ \
    gsl gsl-devel \
    python3-pytest \
    git
