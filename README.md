# GBL Record Maker

This is a simple CRUD app built with Ruby on Rails for creating JSON records that can be pasted directly into SOLR.

It is based on the [OpenGeoMetadata (OGM) Aardvark Schema](https://opengeometadata.org/docs/ogm-aardvark).

Source code: [github.com/HealthyRegions/GBLRecordMaker](https://github.com/HealthyRegions/GBLRecordMaker)

**This is a work-in-progress** - There are some functionality gaps here that need to be addressed, please see the [open Issues](https://github.com/HealthyRegions/GBLRecordMaker/issues) for more information. Contributions are welcome!

## Installation

Run

```
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails s
```

and view the app in your browser at `http://localhost:3000`.
