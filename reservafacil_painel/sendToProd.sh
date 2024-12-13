#!/bin/bash

# This script is used to send the files to the production server

cd build/web

zip -r -q -9 build.zip *

scp -P 4113 build.zip root@painel.reservafacil.site:/var/www/painelreservafacil

