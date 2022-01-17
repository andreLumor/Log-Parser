# log-parser
Building a log parser for the file "games.log".
===  

## Requirements
* rvm ~> 1.29
* ruby ~> 3.1.0
* bundler ~>2.3.3
* rspec ~> 3.10

## How to run
### 1. Clone this repository
```
git clone https://github.com/andreLumor/log-parser.git
```

### 2. Install requirements
#### RVM
Install rvm version 1.29 for your system using this guide: https://rvm.io/rvm/install

#### Ruby
With rvm installed run the command
```
rvm install ruby 3.1.0
```
#### Bundler
To install Bundler, please type as follows:
```
gem install bundler 2.3.3
```
#### Other dependencies
Other dependencies, like rspec, shoud be installed by Bundler. To do so, type as follows:
```
bundle install
```

### 3. Where to download the games.log file
The file can be found at: https://gist.github.com/fabiosammy/ba973184e82e930043df8d4aa002bde4 

### 4. How to test with Rspec
#### Classification
If you want to run the automatized tests with Rspec, please type as follows:
```
bin/rspec
```
ss
### 5. How to run 
To run the main.rb, please type as follows:
```
ruby main.rb [path to a log file]
```
> E.g., `ruby main.rb logs/games.log`


