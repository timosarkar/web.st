install:
		./pharo Pharo.image install.st --save --quit

run:
		./pharo Pharo.image load.st --save --quit
		./pharo Pharo.image --no-quit eval "ZnZincServerAdaptor startOn: 8080"
