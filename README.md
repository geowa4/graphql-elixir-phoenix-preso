# HelloPhoenix

To start this application, you'll first have to spin up the PostgreSQL container.

```
docker-compose up
```

With that running, the database will need to be created and seeded.

```
mix ecto.create
mix ecto.migrate
mix run priv/repo/seeds.exs
```

Now, the application itself can be started.

```
iex -S mix phoenix.server
```

You can connect to your database if you'd like.
The username and password are both `postgres`.

```
pgcli -U postgres -W -d hello_phoenix_dev -h localhost -p 5432
```

With everything running, it's time to open your browser to the application and the Prometheus interface.

```
open http://localhost:4000/
```
