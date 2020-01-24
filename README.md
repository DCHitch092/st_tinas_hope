# st_tinas_hope
A CodeClan Project to create an app for a Vet Hospital Administration System using Ruby and Sinatra.

To set up the app is simple. You will need Ruby installed on your device, as well as PostgreSQL.

To set up the database, run the following in the command line from anywhere on your system: 

```
createdb -d vet_project
```

This should set up a database with the current app settings. Next, run the file 'dogs_data.rb' to populate the database with a working dataset.

To do this go into the project folder and then run this text through the command line:

```
ruby db/dogs_data.rb
```

Now the database has been filled, the app should be able to run. To run the app, navigate to the project folder and through terminal type: 

```
ruby app.rb
```
At this point Sinatra will get things up and running. Wait until the command line tells you that:

``` == Sinatra (v2.0.7) has taken the stage on 4567 for development with backup from WEBrick ```

or words to that effect, and now the app should be up and running.

To view the app, use your browser to visit http://localhost:4567/.

The port may depend on your set-up, but will be indicated in the above message (e.g. 4567).
