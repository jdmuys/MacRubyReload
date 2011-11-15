#
#  rb_main.rb
#  MacRubyReload
#
#  Created by Jean-Denis Muys on 11/15/11.
#  Copyright (c) 2011 Gleamware. All rights reserved.
#

# Loading the Cocoa framework. If you need to load more frameworks, you can
# do that here too.
framework 'Cocoa'

# this function is defined in the main Ruby file so that it can avoid reloading it.
# only from here can we unambiguously construct the name of the main ruby file
def reloadMacRubySource
    main = File.basename(__FILE__)
    
    dir_path = NSBundle.mainBundle.resourcePath.fileSystemRepresentation
    Dir.glob(File.join(dir_path, '*.loc.txt')).each do |loc|
        
        #        path = IO.read(loc)
        File.open(loc, "r") do |file|
            # currently, location files contain only one line. We loop through all lines anyway for future expansion.
            file.each_line do |path|
                path = path.gsub(/\r?\n/, '')
                
                pathBase = File.basename(path)
                if File.basename(path) != main
                    load(path)
                end
            end
        end
    end    
end

# Loading all the Ruby project files.
main = File.basename(__FILE__, File.extname(__FILE__))
dir_path = NSBundle.mainBundle.resourcePath.fileSystemRepresentation
Dir.glob(File.join(dir_path, '*.{rb,rbo}')).map { |x| File.basename(x, File.extname(x)) }.uniq.each do |path|
  if path != main
    require(path)
  end
end

# Starting the Cocoa main loop.
NSApplicationMain(0, nil)
