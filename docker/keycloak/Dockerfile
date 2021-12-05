FROM jboss/keycloak:15.0.0
#COPY themes/agrisud /opt/jboss/keycloak/themes/agrisud

#RUN sed -i -E "s/(<staticMaxAge>)2592000(<\/staticMaxAge>)/\1\-1\2/" /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml
#RUN sed -i -E "s/(<cacheThemes>)true(<\/cacheThemes>)/\1false\2/" /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml
#RUN sed -i -E "s/(<cacheTemplates>)true(<\/cacheTemplates>)/\1false\2/" /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml