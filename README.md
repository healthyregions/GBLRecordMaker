# GBL Record Maker

This is a simple CRUD app built with Ruby on Rails for creating JSON records that can be pasted directly into SOLR.

It is based on the [OpenGeoMetadata (OGM) Aardvark Schema](https://opengeometadata.org/docs/ogm-aardvark).

## Installation

To support the JSON and array fields, a Postgres database backend must be used. You must create a Postgres super user and place these credentials in .env.

```
cp .env.original .env
```

Update the credentials in `.env`, then

```
source .env
```

You should now be able to run

```
rails db:create
rails db:migrate
rails s
```

and view the app in your browser at `http://localhost:3000`.

## Data model

The Record model was created with the following command:

```
rails g model record \
    title:string \
    alternative_tile:array \
    description:array \
    language:array \
    display_note:array \
    creator:array \
    publisher:array \
    provider:array \
    display_note:array \

