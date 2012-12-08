# Course Outcomes Assessment Tool

## Description:
The Course Outcomes Assessment Tool (COAT) is a web application that records and evaluates predefined outcomes for courses based upon direct measures (assignments) and indirect measures (student surveys).

## Application Stack:
* Padrino web framework
* ActiveRecord for database models with a mysql backend
* Slim for HTML view templates
* JQuery JavaScript framework
* Twitter Boostrap CSS/Javascript framework
* RSpec and Cucmber for testing

## Development Environment Installation and Configuration

### Linux and OSX
_Assumes you have a relativly recent unix type system with **Git**, **GCC/CLANG**, and **MySQL** installed._

1. Install ruby 1.9.3 for your distribution, preferably via [rvm](http://rvm.io)
    * rvm additionally requires **Curl** to be installed on your system.
1. Clone the source repository
    * ```$ git clone git@github.com:scottaj/Course-Outcomes-Assessment-Tool.git```
1. cd into the cloned directory
1. Install library dependancies
    * ```$ bundle install```
1. Start the MySQL server and setup database
    * ```$ bundle exec rake ar:setup && bundle exec rake ar:setup PADRINO_ENV=test```
1. _Optional:_ Run test suite to verify application is working
    * ```$ bundle exec rake ci```
1. Start application
    * ```$ bundle exec padrino start```
    * Application should now be acessible in your web browser [here](http://localhost:3000)
    * You can use one of the user accounts in _db/seeds.rb_ to log in.

### Windows
1. Install [Ruby 1.9.3](http://rubyinstaller.org/downloads/) for Windows.
    * On the second tab of the install make sure you check the _Add Ruby executable to your PATH_ option.
1. Install the Ruby for Windows [development kit](http://rubyinstaller.org/downloads/)
    * Download and extract the archive
    * Open a Command Prompt in the extracted archive directory
    * Run the command ```$ ruby dk.rb init```
    * Run the command ```$ ruby dk.rb install```
1. Install [github for windows](http://windows.github.com/)
    * You will need to sign up for a Github Account
1. Clone the repository by clicking the _Clone in Windows_ button on [github](https://github.com/scottaj/Course-Outcomes-Assessment-Tool)
1. Go to the dashboard on the Github windows application.
1. Install Ruby libraries
    * Right click on the project and click _open a shell here_
    * This should open a Powershell window
    * ```$ gem install bundler```
    * ```$ bundle install```
1. Start the MySQL server and setup database
    * ```$ bundle exec rake ar:setup && bundle exec rake ar:setup PADRINO_ENV=test```
1. _Optional:_ Run test suite to verify application is working
    * ```$ bundle exec rake ci```
1. Start application
    * ```$ bundle exec padrino start```
    * Application should now be acessible in your web browser [here](http://localhost:3000)
    * You can use one of the user accounts in _db/seeds.rb_ to log in.
