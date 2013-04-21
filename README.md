Arper
=====

Arper is a tiny end-user tool for detecting ARP poisoning on public networks.

## Purpose
I often work from coffee shops or conferences on public wifi networks. Generally, this is fine and I use a VPN whenever I work on things that need to be kept private (email, IRC, git, etc.). Even still, I want to know when a network I'm using has some rogue actors on it - ARP poisoning attacks are easy to execute and relatively hard to detect without some knowledge of how they work. This tool aims to provide a simple binary answer as to whether ARP spoofing is taking place.

## Notes
* ARP spoofing is occasionally used to make LAN's highly available. It's impossible to determine the difference between spoofing for HA versus malicious use.

## License and Author
Author:: Sam Kottler <shk@linux.com>

Copyright:: 2013, Sam Kottler

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
