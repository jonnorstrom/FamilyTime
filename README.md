# FamilyTime [![Build Status](https://travis-ci.org/jonnorstrom/FamilyTime.svg?branch=master)](https://travis-ci.org/jonnorstrom/FamilyTime)
A application for families to plan events

1. git clone
2. bundle install
3. bundle exec rake db:create
4. bundle exec rake db:migrate
5. bundle exec rake db:seed

Visit [localhost:3000](https://localhost:3000)

Users are
Jane Doe

    email: janedoe@email.com
    password: 'password'
    
John Doe

    email: johndoe@email.com
    password: 'password'
    
Program will automatically prompt user to change password on login if their password is still 'password'
