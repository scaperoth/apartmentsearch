# Requirements
- Ruby 2.4+
- Rails 5+
- Postgresql 9.6.3+

# Setup
### Install Postgress
- Mac:
    - ```brew update```
    - ```brew install postgresql```
- Windows:
    - https://www.postgresql.org/download/windows/
- Linux (Debian):
    - ```sudo apt-get install postgresql```
> I would also suggest installing a postgresql gui tool like [postgresapp](https://postgresapp.com/documentation/gui-tools.html) or [pgAdmin](https://www.pgadmin.org/)
### Add Environment Variables
Setting up enviornment variables is different in each OS. For Mac it will be in the ~/.bash_profile file. In Linux it will be in ~/.bashrc. For windows, you can (Google it)[http://lmgtfy.com/?q=windows+environment+variables]
- ```POSTGRESQL_USERNAME```
- ```POSTGRESQL_PASS```
- ```ADMIN_USER``` (email)
- ```ADMIN_USER_PASS``` (longer than 6 characters)
- ```APARTMENTSEARCH_DATABASE_PASSWORD``` (optional - only for production environment)
#Install 
- ```bundle install``` (this may take a minute)
- ```bundle exec rake db:create```
- ```bundle exec rake db:migrate```
- ```bundle exec rake db:seed```
 
