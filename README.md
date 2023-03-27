# GBL Record Maker

This is a simple CRUD app built with Ruby on Rails for creating JSON records that can be pasted directly into SOLR.

It is based on the [OpenGeoMetadata (OGM) Aardvark Schema](https://opengeometadata.org/docs/ogm-aardvark).

## Installation

Run

```
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails s
```

and view the app in your browser at `http://localhost:3000`.
