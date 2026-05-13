"main seaside app - Pharo 9 compatible"

Transcript show: '=== Starting Seaside setup ==='; cr.

"1. Clear everything first"
WAAdmin clearAll.

"2. Clean up old applications (safe)"
WAAdmin defaultDispatcher handlers keys
    \ #('root' 'hello' 'files' 'config')
    do: [ :appName |
        [ WAAdmin defaultDispatcher unregister: (WAAdmin defaultDispatcher handlerAt: appName) ]
            on: Error do: [ :ex |
                Transcript show: 'Skipped: ', appName; cr ] ].

Transcript show: 'Old applications cleaned.'; cr.

"3. Root Component"
WAComponent subclass: #Mytestcomp2
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'TinyBlog-Components'.

Mytestcomp2 compile: 'renderContentOn: html
    html heading level: 1; with: ''Hello Seaside''.
    html paragraph: ''This is the ROOT component (at /)''.'.

Mytestcomp2 class compile: 'canBeRoot ^ true'.

"4. Second Component"
WAComponent subclass: #Mytestcomp
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'TinyBlog-Components'.

Mytestcomp compile: 'renderContentOn: html
    html heading level: 1; with: ''Hello Seaside''.
    html paragraph: ''This is my component (at /hello)''.'.

Mytestcomp class compile: 'canBeRoot ^ true'.

"5. Register applications"
WAAdmin register: Mytestcomp2 asApplicationAt: 'root'.
WAAdmin register: Mytestcomp  asApplicationAt: 'hello'.

"6. Set root as default"
WAAdmin defaultDispatcher defaultName: 'root'.

Transcript show: '=== Seaside applications registered successfully ==='; cr.
Transcript show: '→ Root:  http://localhost:8080/'; cr.
Transcript show: '→ Hello: http://localhost:8080/hello'; cr.
Transcript show: '→ Config: http://localhost:8080/config'; cr.

"7. Auto-start server"
ZnZincServerAdaptor startOn: 8080.
