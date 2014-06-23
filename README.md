# GIT ART
> Put some art into your [GitHub](https://github.com/) contributions calendar.

## Example
![Git Art Example](../screenshots/git-art-example.png?raw=true "Optional Title")

## Usage
Clone the git-art repo locally:
```
git clone https://github.com/mikegroseclose/git-art.git
```

From the git-art directory run the following:
```
./git-art.rb <template>
```
where ```<template>``` is a template file in the ./templates directory.

Example:
```
./git-art.rb templates/groseclose.txt
```

Follow the output at the end of the ./git-art.rb to update your GitHub contributions calendar.

## Templates
In the ./templates directory is an empty.txt which can be modified to create new templates.

The emtpy.txt file contains seven rows of comma separated values:
* Each row represents a day of the week.
* Each column represents a week in the year.
* Each comma separated value represents the numbers of commits to perform on that day.

## Contributing
Help by contributing your templates to the project.
To have your templates added to the project submit a Pull Request using the [GitHub Pull Request Process](https://help.github.com/articles/using-pull-requests).

## Connect
Drop me a line on on [twitter] if you have any questions or comments.
[Follow me][twitter] to get updates as well as my random thoughts on technology and code.

## License

[MIT](http://opensource.org/licenses/MIT) © [Mike Groseclose](//github.com/mikegroseclose)

[twitter]: https://twitter.com/mikrofusion
