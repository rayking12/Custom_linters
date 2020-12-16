# Custom_linters


# About 

this custom linter deals with the idea of checking one's code and looking fo errors, As a develeopr, Errors are bound in one's code, it handles that for the developer and makes sure the developer has minimal or no errors in his code

# The Build
The custom Ruby linter  checks for the following errors/warnings.
- check for wrong indentation
- check for trailing spaces
- check empty line error

## Built With
- Ruby
- RSpec for Ruby Testing


# Getting Started

To get a local copy of the repository please run the following commands on your terminal:

```
$ cd <folder>
```

```
$ git clonehttps://github.com/rayking12/Custom_linters
```

**To check for errors on a file:** 

~~~bash
$ bin/main new.rb
~~~
 **To test a file of no errors:**

 ~~bash
 $ bin/main corrected_method.rb
 ~~~

 ## Testing

To test the code, run `rspec` from root of the folder using terminal.
Note: `new.rb` it has been excluded from the rubocop test

> Rspec is used for the test, to install the gem file, run

~~~bash
$ bundle install 
~~~

> But before that, make sure you have **bundler** installed on your system, else run

~~~bash
$ gem install bundler 
~~~

> or you simply install the the following directly using 

~~~bash
$ gem install rspec 
~~~

~~~bash
$ gem install colorize 
~~~


# Author

👤 **Ray King**

- Github: [@rayking12](https://github.com/rayking12/)
- Twitter: [@twitterhandle](https://twitter.com/_rayKing__)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/king-ray-514b89133)
