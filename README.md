# Iyoutu

Iyoutu is an extremely and limited wrapper around https://github.com/rg3/youtube-dl, allowing to interactively choose (in a terminal) which format to download.

Copyright 2019, Felix Wolfsteller
Released under the GPL (see LICENSE file).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'iyoutu'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iyoutu

## Usage

Call as

  iyoutu URL

where URL is the path to a source from which to download (possible sources are documented [in the youtube-dl documentation](http://rg3.github.io/youtube-dl/supportedsites.html)).

Make sure that you already have youtube-dl somewhere on your PATH and that you know what you are doing with it.

Example:

  ➜  $ ✗ iyoutu https://www.youtube.com/watch\?v\=anyvideoid
  Select format (audio and video combined) 
    3gp/176x144    small   38k , mp4v.20.3, mp4a.40.2@ 24k (22050Hz), 24.08MiB
    3gp/320x180    small   95k , mp4v.20.3, mp4a.40.2 (22050Hz), 58.90MiB
  ‣ webm/640x360    medium , vp8.0, vorbis@128k, 92.47MiB
    mp4/640x360    medium  200k , avc1.42001E, mp4a.40.2@ 96k (44100Hz), 123.99MiB
    mp4/1280x720   hd720  176k , avc1.64001F, mp4a.40.2@192k (44100Hz) (best)
    -> Download audio and video seperately
    ! Abort

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fwolfst/iyoutu. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Iyoutu project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/iyoutu/blob/master/CODE_OF_CONDUCT.md).
