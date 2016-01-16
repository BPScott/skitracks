SkiTracks
=========

For understanding KMZ exports from SkiTracks and plotting them on a Google map,
along with other metadata.


Installation
------------

```sh
bundle install
```

Preparsing KMZs
---------------

Before showing things off on the site, we need to covert the KMZ to a format
that the site can understand. Place KMZ files in the /tracks/_export folder. Run
the following to create a set of exported tracks in the /tracks folder:

```sh
bundle exec compile-tracks.rb
```
