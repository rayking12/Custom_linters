# Custom_linters


# About 

this custom linter deals with the idea of checking one's code and looking for errors, As a develeopr, Errors are bound in one's code, it handles that for the developer and makes sure the developer has minimal or no errors in the code.

# The Build
The custom Ruby linter  checks for the following errors/warnings.
- check for wrong indentation
- check for trailing spaces
- check empty line error

## Built With
- Ruby
- RSpec for Ruby Testing

> These are examples of good and bad codes. The good practises of code and the bad practises are shown below.

## Indentation Error Check
~~~ruby
# Good Code

class Testing_Error
  def school(name)
    @name = @name     
    @school = @school
  end
end

# Bad Code

class Testing_Error
  def school(name)
            @name = @name     
        @school = @school

  end
~~~

## Trailing spaces
~~~ruby
# Good Code

class Testing_Error
  def school(name) 
    @name = @name     
    @school = @school
  end
end

# Bad Code

class Testing_Error
  def school(name) ~
    @name = @name     
    @school = @school
  end
end



## Missing/unexpected end
~~~ruby
# Good Code

class Testing_Error
  def school(name) 
    @name = @name     
    @school = @school
  end
end

# Bad Code

class Testing_Error
  def school(name) 
    @name = @name     
    @school = @school
  end
end
end
~~~

## Empty line error
~~~ruby
# Good Code

class Testing_Error
  def school(name) 
    @name = @name     
    @school = @school
  end
end

# Bad Code

class Testing_Error
  def school(name) 
  
    @name = @name     
    @school = @school
  end
end
~~~


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
Note: `new.rb`&& `corrected_method` has been excluded from the rubocop test

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

## 🤝 Contributing

Contributions, issues and feature requests are welcome! Thank You!