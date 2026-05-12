"main seaside app"

WAComponent subclass: #Mytestcomp
  instanceVariableNames: ''
  classVariableNames: ''
  package: 'TinyBlog-Components'.

Mytestcomp compile: 'renderContentOn: html
    html heading: ''Hello Seaside''.
    html paragraph: ''This is my first component''.
'.

WAAdmin register: Mytestcomp asApplicationAt: 'hello'
