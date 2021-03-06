#
# Cookbook Name:: jruby
# Recipe:: default
#
# Copyright 2011, Heavy Water Software Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "java"

version = node[:jruby][:version]

remote_file "/usr/src/jruby-bin-#{version}.tar.gz" do
  source "http://jruby.org.s3.amazonaws.com/downloads/#{version}/jruby-bin-#{version}.tar.gz"
  checksum node[:jruby][:checksum]
end

execute "untar jruby" do
  command "tar xzf jruby-bin-#{version}.tar.gz"
  cwd "/usr/src"
  creates "/usr/src/jruby-#{version}/README"
end

link "/usr/bin/jruby" do
  to "/usr/src/jruby-#{version}/bin/jruby"
end

link "/usr/bin/jirb" do
  to "/usr/src/jruby-#{version}/bin/jirb"
end

link "/usr/bin/jgem" do
  to "/usr/src/jruby-#{version}/bin/jgem"
end
