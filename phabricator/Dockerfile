
# Pull base image.
FROM ubuntu:14.04

MAINTAINER lzy7750015@gmail.com

# Install Java.
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  mkdir -p /var/www && \
  apt-get install -y wget && \
  cd /var/www && \
  wget http://www.phabricator.com/rsrc/install/install_ubuntu.sh && \
  chmod +x install_ubuntu.sh && \
  ./install_ubuntu.sh && \
  sed -i 's/^\([mysqld]\s*\)/\1\nsql_mode=STRICT_ALL_TABLES\nft_stopword_file=\/var\/www\/phabricator\/resources\/sql\/stopwords.txt\nft_min_word_len=3\ninnodb_buffer_pool_size=1600M\n
/' /etc/mysql/my.cnf && \
  sed -i 's/^\(#<\/Directory>*\)/\1<Directory "/var/www/phabricator/webroot">\nRequire all granted\n<\/Directory>/' /etc/apache2/apache2.conf && \
  echo "<VirtualHost *>
  # Change this to the domain which points to your host.
  ServerName localhost

  # Change this to the path where you put 'phabricator' when you checked it
  # out from GitHub when following the Installation Guide.
  #
  # Make sure you include "/webroot" at the end!
  DocumentRoot /var/www/phabricator/webroot

  RewriteEngine on
  RewriteRule ^/rsrc/(.*)     -                       [L,QSA]
  RewriteRule ^/favicon.ico   -                       [L,QSA]
  RewriteRule ^(.*)$          /index.php?__path__=$1  [B,L,QSA]
</VirtualHost>
" > /etc/apache2/sites-enabled/000-default.conf && \
  rm -rf /var/lib/apt/lists/*

VOLUME ["/usr/local/nexus", "/usr/local/sonatype-work"]

CMD /usr/local/nexus/bin/nexus console

EXPOSE 80