# FROM dotnetcore:0.1
 FROM newtest0

# Install
# WORKDIR /usr/src/app
ENV HOME=/root \
	LANG=en_US.UTF-8 \
	LANGUAGE=en_US.UTF-8 \
	LC_ALL=C.UTF-8 \
	REMOTE_HOST=localhost \
	REMOTE_PORT=5900 \
    DISPLAY=0

RUN apt-get update
RUN apt-get install -y git bash supervisor nodejs
RUN \
	apt-get update \
	&& \
	apt-get install --yes \
		net-tools \
	&& \
    apt-get install --yes \
       python \
	&& \
    apt-get install --yes \
       python-pip \
	&& \
	pip install --no-cache-dir \
		numpy 
    RUN ls -l /root
    RUN apt install -y nodejs
    RUN apt install -y npm
    RUN apt install -y git 
    RUN npm install npm@latest -g
	RUN git clone https://github.com/novnc/noVNC.git /root/noVNC
	RUN git clone https://github.com/kanaka/websockify.git /root/noVNC/utils/websockify 
    RUN pwd
	# RUN rm -rf /root/noVNC/.git
	# RUN rm -rf /root/noVNC/utils/websockify/.git
	RUN cd /root/noVNC
    RUN ls -l /root/noVNC
    RUN pwd
    # RUN npm install commander --save
    # RUN npm install fs-extra --save
    # RUN npm install --save-dev @babel/core @babel/preset-env
    # RUN npm install browserify --save
    RUN cd /root/noVNC && npm install nodejs@latest
    RUN cd /root/noVNC && npm install
    RUN ls -l /root/noVNC/utils/
	RUN cd /root/noVNC && /root/noVNC/utils/use_require.js --as commonjs --with-app
	RUN cp /root/noVNC/node_modules/requirejs/require.js /root/noVNC/build
	RUN cd /root/noVNC && sed -i -- "s/ps -p/ps -o pid | grep/g" /root/noVNC/utils/launch.sh
	# RUN apk del git nodejs-npm nodejs
    RUN cp -r /root/noVNC /opt/novnc
    RUN ls -l /opt/novnc/
    RUN apt-get install -y x11vnc
    RUN apt-get install -y xvfb
    RUN apt-get install -y fluxbox

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# desktop enviroment
# RUN apt-get install -y task-xfce-desktop
# RUN systemctl set-default graphical.target
# RUN apt-get install xfce4 -y && apt-get install xfce4-goodies -y && apt-get purge -y pm-utils xscreensaver* && systemctl set-default graphical.target
# RUN apt-get install xfce4-goodies -y
# RUN apt-get purge -y pm-utils xscreensaver*

EXPOSE 8787 5900

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]