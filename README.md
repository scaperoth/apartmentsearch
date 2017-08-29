# Requirements
- Ruby 2.4+
- Rails 5+
- Postgresql 9.6.3+

# Installation
- Install postgres
    - Mac:
        - ```brew update```
        - ```brew install postgresql```
        - I would also suggest installing a gui like https://postgresapp.com/documentation/gui-tools.html
    - Windows:
        - https://www.postgresql.org/download/windows/
    - Linux (Debian):
        - ```sudo apt-get install postgresql```
- Set up environment variables
    - ```POSTGRESQL_USERNAME```
    - ```POSTGRESQL_PASS```
    - ```ADMIN_USER``` (email)
    - ```ADMIN_USER_PASS``` (longer than 6 characters)
    - ```APARTMENTSEARCH_DATABASE_PASSWORD``` (optional - only for production environment)
- from project root
    - ```bundle install``` (this may take a minute)
    - ```bundle exec rake db:create```
    - ```bundle exec rake db:migrate```
    - ```bundle exec rake db:seed```
 
