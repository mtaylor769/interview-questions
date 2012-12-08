#!/bin/bash
echo "==========================="
echo "Running the Sinatra server at login/login.rb"
echo "Use Ctrl + C to stop the server"
echo "==========================="

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ruby $DIR/../login.rb