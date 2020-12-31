FROM registry.fedoraproject.org/fedora:33

LABEL name="fedora-fpm" \
      version="1.0.0" \
      architecture="x86_64" \
      URL="https://github.com/rhjhunt/fedora-fpm" \
      vcs-type="git" \
      vcs-url="https://github.com/rhjhunt/fedora-fpm.git" \
      distribution-scope="public" \
      summary="Fedora running the fpm process" \
      maintainer="Jacob Hunt <jhunt@redhat.com>"

RUN dnf -y --setopt=tsflags='' update && \ 
    dnf -y --setopt=tsflags='' install php-fpm php-gd php-json php-mysqlnd && \
    dnf clean all && \
    rm -rf /var/cache/dnf

ENTRYPOINT ["/usr/sbin/php-fpm"]
CMD ["--nodaemonize"]
