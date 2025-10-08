FROM nginx:1.23.3-alpine as build

LABEL name="micro-lc-angular-14-template" \
      description="Use this template to set up a micro-lc Angular 14 plugin project" \
      eu.mia-platform.url="https://www.mia-platform.eu" \
      eu.mia-platform.version="0.1.0"

COPY nginx /etc/nginx

RUN touch ./off \
  && chmod o+rw ./off \
  && echo "micro-lc-angular-14-template: $COMMIT_SHA" >> /etc/nginx/commit.sha

WORKDIR /usr/static

COPY ./dist .

USER nginx
