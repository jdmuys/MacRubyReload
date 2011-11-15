MacRubyReload: dynamic reloading of application source code without rebuilding

In my mind, one of the major promise of MacRuby as a development language for Mac application programming is to empower the developer to embrace an incremental, dynamic, interpreted workflow loop.

The common compile workflow is:

1- Edit/Save
2- Compile
3- Run
4- Exercize the application to the point under development
5- Test
6- Notice a bug
7- Quit
8- go to step 1

Very soon, this workflow loop becomes time-consuming: compile times increase as the application gets bigger, application startup time increase as the application does more, and exercizing the app to the point under development can sometimes take very long to do.

The interpreted workflow is:

1- Run
2- Exercize the application to the point under development
3- Test
4- Notice a bug
5- Edit
6- go to step 3

So you go from an  8 step loop which includes 3 time intensive steps to a 4 step loop with no time intensive loop.

Unfortunately, MacRuby as of version 0.10 doesn't propose this workflow. Instead, the Xcode template that it provides replicate the compile workflow even though there is no mandatory compile.

This project shows how to implement an interpreted workflow using MacRuby. Hopefully, MacRuby will eventually evolve to include a similar facility in its default Xcode templates.

How to use:

- Download and run the project
- Notice a new MacRuby menu, with two items: "Reload Ruby" and "Test"
- Select "Test". You will get a nice greeting in the console.
- Without quitting, switch back to Xcode, select the AppDelegate.rb file.
- Modify the doTest method. You can for example uncomment the second greeting line. Don't forget to save.
- Switch back the running MacRubyReload application
- Select "Reload Ruby"
- Select "Test" again. You will now see your modified greeting.

How it works:
- a custom build rule for Ruby (.rb) files produces very simple text files (source.loc.txt) that contain the full path name of every Ruby source files for the current target. These location files are copied to the application main bundle resource directory.
- a reloadMacRubySource function has been added to the main Ruby file (rb_main.rb). That function walks the app bundle resource directory looking for those location files. It then reads them and call "load" on each file listed in them.
- the reloadMacRubySource is called in the Interface Builder Action method connected to the Reload Ruby menu item.

That's it


Improvement ideas:

automatic reload using File System Events
