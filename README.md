# O'Tock (Backend)
This repo is for the Backend of O'Tock. For a full description, please see the [Frontend](https://github.com/Zietieflr/project-mod5-frontend).

## Project setup
This repo is the Backend, you'll need both this repository and the [Frontend](https://github.com/Zietieflr/project-mod5-frontend) running locally to get the full effect of this project. The [Frontend](https://github.com/Zietieflr/project-mod5-frontend) will cover everything not directly related to the Ruby on Rails installation.

This guide assumes you have [Ruby on Rails installed](https://guides.rubyonrails.org/v5.0/getting_started.html).

Once you have this repository locally, navigate to the local directory for the project in terminal and run:
```
bundle install
```
Once that finishes, Rails is set up. Then we just need to get Rails up to speed with what the project needs with: 
```
rails db:migrate
```
That's it! we're ready to host the backend server. 

## Running a development server
Inside the local directory, run: 
```
rails s
```
This will run your backend server on port 3000 (which the [Frontend](https://github.com/Zietieflr/project-mod5-frontend) assumes).