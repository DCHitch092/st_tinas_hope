# st_tinas_hope
A CodeClan Project to create an app for a Vet Hospital Administration System using Ruby and Sinatra.

To set up the app is simple. You will need Ruby installed on your device, as well as PostgreSQL.

To set up the database, run the following in the command line: 

```
createdb -d vet_project
```

This should set up a database with the current app settings. Next, run the file 'dogs_data.rb' to populate the database with a working dataset.
To do this, simple type:

```
ruby db/dogs_data.rb
```

To run the app, simple type in the command line: 

```
ruby app.rb
```

Wait until the command line tells you that:

``` == Sinatra (v2.0.7) has taken the stage on 4567 for development with backup from WEBrick ```

or words to that effect, and now the app should be up and running. In your browser, visit the default port http://localhost:4567/ to see the app running. The port may depend on your set-up, but will be indicated in the above message (e.g. 4567)
