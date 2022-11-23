# Flying Toasters Live Desktop for macOS

(Using Xojo and OpenGL)

![Screenshot](/screenshots/screenshot1.png)

A “live desktop” version of the old Flying Toasters screensaver from the 80s/90s.

I am working on a proper screensaver version, but I thought it would be fun to see how it worked like this. (And I also wanted to get the animations of the flapping wings all sorted out.)

There’s a very rudimentary preferences window for choosing which monitors it displays on. No preferences files or anything like that are written to hard drive, as I just could not be bothered.

[Flying Toasters Desktop macOS universal binary zipped for download](https://dl.dropboxusercontent.com/s/rqcjp4xb7m827tv/FlyingToastersLiveDesktop.zip?dl=0)

Only tested on macOS Catalina (10.15) at the moment, but there’s no reason it shouldn’t be okay on Big Sur, Monterey and Ventura. The zipped binary available for download above is for both Intel and the new Apple silicon.

It’s all a bit rough and ready when it comes to configuring how many items can be on screen at the same time, how quickly they are generated, how quickly they move across the screen, how big they are, and how many items of each type (toaster, police toaster, toast, and burnt toast) are generated.

Basically, I got everything working pretty much the way I wanted on my Mac, and left it at that. There are some magic numbers which can be tweaked in the `Config` module. If you want to mess with other settings, it can only be done through the source code at the moment. Perhaps one day if I have the energy I’ll do proper config dialogs, but for now this is it.
