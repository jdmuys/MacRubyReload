#
#  AppDelegate.rb
#  MacRubyReload
#
#  Created by Jean-Denis Muys on 11/15/11.
#  Copyright 2011 Jean-Denis Muys. All rights reserved.
#
# License: attributionware. Simply credit me.

class AppDelegate
    attr_accessor :window
    def applicationDidFinishLaunching(a_notification)
        # Insert code here to initialize your application
    end
    
    def doReloadSource(sender)
        puts "Reloading MacRuby source code\n";
        reloadMacRubySource;
    end
    
    def doTest(sender)
        #puts "Hello, Dynamic MacRuby World!\n"
        puts "Hello, Modified MacRuby World!\n"
    end

end

