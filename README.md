# EDI Example

This project was created as an example to the discipline of distributed systems. It communicates with a [Rails API](https://github.com/silviolrjunior/edi_example_api) that will be consumed by an [Ember APP](https://github.com/silviolrjunior/edi_example).

### Requirements
* Ruby 2.2.2
* Bundler
* redis
* This [Rails API](https://github.com/silviolrjunior/edi_example_api)

### Running
If you wanna run this example, you should:
* Install redis
* Clone this project
* Run ```bundle install```
* Run ```rake db:create && rake db:migrate```
* Run ```bin/rails s```
* Run this [Rails API](https://github.com/silviolrjunior/edi_example_api)
* And be happy!

### Contributing
If you wanna improve something or create new features, fell free for:
* Forking this project
* Create a new pull request

Or just:
* Create a new issue
