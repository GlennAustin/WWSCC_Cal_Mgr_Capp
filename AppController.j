/*
 * AppController.j
 * WWSCC_Cal_Mgr_Capp
 *
 * Created by Glenn L. Austin on December 30, 2012.
 * Copyright 2012, Austin-Soft.com All rights reserved.
 */

@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
    CPView *mainView;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    var panelRect = [contentView bounds];
    panelRect.size.height = 48;

    var topPanel = [[CPView alloc] initWithFrame:CGRectMakeZero()];
    [topPanel setBackgroundColor:[CPColor colorWithCalibratedRed:64.0/255.0 green:128.0/255.0 blue:0.0 alpha:1.0]];
    [topPanel setAutoresizingMask:CPViewWidthSizable | CPViewMaxYMargin];
    
    [contentView addSubview:topPanel];
    [topPanel setFrameOrigin:panelRect.origin];
    [topPanel setFrameSize:panelRect.size];
    var label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];

    [label setStringValue:@"WWSCC Calendar Manager"];
    [label setFont:[CPFont boldSystemFontOfSize:24.0]];
    [label setTextColor:[CPColor colorWithCalibratedRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
    
    [label setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [label sizeToFit];

    [topPanel addSubview:label];

    [label setCenter:[topPanel center]];
    
    var mainRect = [contentView bounds];
    mainRect.origin.y = mainRect.origin.y + panelRect.size.height;
    mainRect.size.height = mainRect.size.height - mainRect.origin.y;
    
    mainView = [[CPView alloc] initWithFrame:CGRectMakeZero()];
    [mainView setBackgroundColor:[CPColor colorWithCalibratedRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
    [mainView setAutoresizingMask:CPViewNotSizable];
    [mainView setAutoresizesSubviews:YES];
    
    [contentView addSubview:mainView];
    [mainView setFrameOrigin:mainRect.origin];
    [mainView setFrameSize:mainRect.size];
    
    label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];

    [label setStringValue:@"Hello!"];
    [label setFont:[CPFont boldSystemFontOfSize:24.0]];
    [label setTextColor:[CPColor colorWithCalibratedRed:1.0 green:0.0 blue:0.0 alpha:1.0]];
    
    [label setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [label sizeToFit];

    [mainView addSubview:label];
    [label setCenter:[mainView center]];
    
    [theWindow orderFront:self];

    // Uncomment the following line to turn on the standard menu bar.
    //[CPMenu setMenuBarVisible:YES];
}

@end
