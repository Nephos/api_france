#ApiFrance

ApiFrance is a simple ruby application to serve an api with cities, regions, departments of France.
Simply configure your `db/database.yml` and then run : `rake create && rake migrate && rake seed`.
It can take a while (38k records).
Then, run ``ruby api_france.rb`` and got to `localhost:8080/cities?id=1` for example.
