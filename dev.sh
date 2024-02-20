brew install rbenv ruby-build imagemagick
rbenv init
bash

# install a version
rbenv install -l
rbenv install 2.6.10
rbenv local 2.6.10

# check gem location, should be local directory
eval "$(rbenv init - bash)"
which gem
gem install bundle
bundle install
bundle exec jekyll serve --lsi
