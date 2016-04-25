#   Copyright 2016 Passback Consulting
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

FROM alpine
MAINTAINER Passback Consulting <docker@passback.co.uk>

RUN apk add --update gettext gcc python3-dev musl-dev libffi-dev openssl-dev && rm -rf /var/cache/apk/*

RUN python3 -m ensurepip && rm -r /usr/lib/python*/ensurepip

RUN pip3 install https://github.com/errbotio/errbot/archive/master.zip
RUN pip3 install slackclient

RUN mkdir -p /errbot/err
RUN mkdir -p /errbot/plugin
ADD config.py.template /errbot/config.py.template
ADD plugin /errbot/plugin

CMD envsubst < /errbot/config.py.template > /errbot/config.py && \
    errbot -c /errbot/config.py
