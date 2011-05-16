Description
===========

[Jellyfish](https://github.com/dje/jellyfish) is a quick-and-dirty
hack to push a [GitHub post-receive
webhook](http://help.github.com/post-receive-hooks/) through to a set
of [Opscode Chef](http://opscode.com/chef/) nodes causing them to
converge.

Requirements
============

Platform
--------

* Ubuntu

Tested on Ubuntu 10.04. It _may_ work on other platforms.

Cookbooks
---------

* python

Attributes
==========

* `node[:jellyfish][:id]` = The websocket identifier to monitor for
  deploy signals. Generating a new identifier is a requirement.
* `node[:jellyfish][:endpoint]` = The service
  endpoint. Defaults to http://jlyfish.com/deploy.
* `node[:jellyfish][:command]` = The command to run after receiving an
  event. Defaults to chef-client.

Usage                                                                                                                                                                       
=====

default                                                                                                                                                                     
-------

Include default recipe in a run list to install a jellyfish client.

server
------

Installs the requirements for running a server. Please note that I
don't know how to properly package or initialize an Erlang app yet. So
as far as starting the server goes you're on your own for the time
being. Pull requests welcome!
