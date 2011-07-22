#
# Cookbook Name:: grok
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

include_recipe "git"

package "bison"
package "exuberant-ctags"
package "flex"
package "gperf"
package "libevent-dev"
package "libpcre3-dev"
package "libtokyocabinet-dev"

git "/usr/src/grok" do
  repository "https://github.com/jordansissel/grok.git"
  reference "master"
  action :checkout
end

execute "install grok" do
  command "make install"
  cwd "/usr/src/grok"
  creates "/usr/bin/grok"
end
