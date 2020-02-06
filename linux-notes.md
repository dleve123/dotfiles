## Rbenv

Installing `rbenv` was as simple as a `sudo apt install rbenv`

However, the version of `ruby-build` included with this version of `rbenv` was
super old (2017), so it wasn't aware of recent releases of Ruby. For example,
2.6.5.

Updating to a more modern version of `ruby-build` was a matter of installing
via:

`git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build`

(source: [Digital Ocean docs][0])

[0]: https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-16-04
