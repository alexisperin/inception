#!/bin/sh

envsubst < /wordpress.sql | sponge /wordpress.sql
mysqld --bind-address 0.0.0.0 --init-file /wordpress.sql
