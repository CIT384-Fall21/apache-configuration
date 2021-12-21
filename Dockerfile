FROM ubuntu:20.04
ENV USER user1
# bc newer ubuntu asks for timezone info
ENV TZ=US/Pacific
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y apache2
WORKDIR /etc/apache2

RUN a2enmod userdir
RUN a2enmod autoindex
RUN a2enmod alias

# copy splash page, 403/404 pages, assets dir, and vhost conf
#COPY index.html /var/www/html
RUN mkdir /var/www/html/errors
COPY not-found.html /var/www/html/errors
COPY forbidden.html /var/www/html/errors
COPY assets /var/www/html/assets
COPY vhost.conf /etc/apache2/sites-available/000-default.conf

# set up /marketing
RUN mkdir -p /marketing/promotions
COPY index.html /marketing
COPY assets /marketing/assets
RUN groupadd marketing 
RUN chown -R root.marketing /marketing

# create users and public_html dir, copy files
RUN useradd -ms /bin/bash $USER
RUN mkdir /home/$USER/public_html 
COPY user1.html /home/$USER/public_html/index.html
COPY user1/assets /home/$USER/public_html/assets
RUN chown -R $USER.$USER /home/$USER

RUN useradd -ms /bin/bash user2
RUN mkdir /home/user2/public_html 
COPY user2.html /home/user2/public_html/index.html
COPY user2/assets /home/user2/public_html/assets
RUN chown -R user2.user2 /home/user2

RUN useradd -ms /bin/bash user3
RUN mkdir /home/user3/public_html 
COPY user3.html /home/user3/public_html/index.html
COPY user3/assets /home/user3/public_html/assets
RUN chown -R user3.user3 /home/user3

RUN useradd -ms /bin/bash user4
RUN mkdir /home/user4/public_html 
COPY user4.html /home/user4/public_html/index.html
COPY user4/assets /home/user4/public_html/assets
RUN chown -R user4.user4 /home/user4

RUN useradd -ms /bin/bash user5
RUN mkdir /home/user5/public_html 
COPY user5.html /home/user5/public_html/index.html
COPY user5/assets /home/user5/public_html/assets
RUN chown -R user5.user5 /home/user5

LABEL maintainer="monica.luong.234@my.csun.edu"
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
