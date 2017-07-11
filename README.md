# Vagabond

### Add a few lines about the travel app

Heroku Link: https://shrouded-reef-89184.herokuapp.com/

## Technologies used:
- Rails version 5.1.2
- Ruby version 2.4.0
- Clearance gem for managing User sessions
- Postgresql as the database
- Bootstrap for styling and CSS

## Existing Features:
- Users navigate to a cities page linked from the homepage and browse posts related to that city. However to read the whole post or to add new posts they need to login / sign up for the application.
- Once signed up a user can
    - Add new posts to a particular city page
    - Update his own posts
    - Delete his own posts
- User can update his own profile from the edit profile  section of the navbar.

## Planned Features:
- Google Maps integration to show all cities on a main map
- Social capabilities/adding comments for each post.
- Receive badges for increased activity on the site


## Screenshot of the app
![screenshot #1](/public/vagabond_splash.png?raw=true "Vagabond")



## Endpoints:
- get "/sign_in" => "clearance/sessions#new", as: "sign_in"
- delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
- get "/sign_up" => "clearance/users#new", as: "sign_up"

- get "/entries" => "entries#index", as: "entries"
- post "/entries" => "entries#create"
- get "/cities/:id/entries/new" => "entries#new", as: "new_entry"
- get "/entries/:id/edit" => "entries#edit", as: "edit_entry"
- get "/entries/:id" => "entries#show", as: "entry"
- put "/entries/:id" => "entries#update", as: "update_entry"
- delete "/entries/:id" => "entries#destroy"

- get '/cities/:id' => 'cities#show', as: 'city'
