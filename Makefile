install:
		~/.pharo9/pharo ~/.pharo9/Pharo.image deps.st --save --quit

run:
		~/.pharo9/pharo ~/.pharo9/Pharo.image app.st --save --quit
	  ~/.pharo9/pharo ~/.pharo9/Pharo.image --no-quit eval "ZnZincServerAdaptor startOn: 8080"
		
