//
//  main.m
//  MacRubyReload
//
//  Created by Jean-Denis Muys on 11/15/11.
//  Copyright (c) 2011 Gleamware. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
    return macruby_main("rb_main.rb", argc, argv);
}
