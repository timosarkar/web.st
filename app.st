"main seaside app. tested on pharo 9"

WAComponent subclass: #Mytestcomp
  instanceVariableNames: ''
  classVariableNames: ''
  package: 'TinyBlog-Components'.

Mytestcomp compile: 'renderContentOn: html
    html heading: ''Hello Seaside''.
    html paragraph: ''This is my first component''.
'.

WAAdmin register: Mytestcomp asApplicationAt: 'hello'
