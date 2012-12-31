/*
 * Jakefile
 * WWSCC_Cal_Mgr_Capp
 *
 * Created by Glenn L. Austin on December 30, 2012.
 * Copyright 2012, Austin-Soft.com All rights reserved.
 */

var ENV = require("system").env,
    FILE = require("file"),
    JAKE = require("jake"),
    task = JAKE.task,
    FileList = JAKE.FileList,
    app = require("cappuccino/jake").app,
    configuration = ENV["CONFIG"] || ENV["CONFIGURATION"] || ENV["c"] || "Debug",
    OS = require("os");

app ("WWSCC_Cal_Mgr_Capp", function(task)
{
    task.setBuildIntermediatesPath(FILE.join("Build", "WWSCC_Cal_Mgr_Capp.build", configuration));
    task.setBuildPath(FILE.join("Build", configuration));

    task.setProductName("WWSCC_Cal_Mgr_Capp");
    task.setIdentifier("com.austin-soft.WWSCC_Cal_Mgr_Capp");
    task.setVersion("1.0");
    task.setAuthor("Austin-Soft.com");
    task.setEmail("support@austin-soft.com");
    task.setSummary("WWSCC_Cal_Mgr_Capp");
    task.setSources((new FileList("**/*.j")).exclude(FILE.join("Build", "**")));
    task.setResources(new FileList("Resources/**"));
    task.setIndexFilePath("index.html");
    task.setInfoPlistPath("Info.plist");

    if (configuration === "Debug")
        task.setCompilerFlags("-DDEBUG -g");
    else
        task.setCompilerFlags("-O");
});

task ("default", ["WWSCC_Cal_Mgr_Capp"], function()
{
    printResults(configuration);
});

task ("build", ["default"]);

task ("debug", function()
{
    ENV["CONFIGURATION"] = "Debug";
    JAKE.subjake(["."], "build", ENV);
});

task ("release", function()
{
    ENV["CONFIGURATION"] = "Release";
    JAKE.subjake(["."], "build", ENV);
});

task ("run", ["debug"], function()
{
    OS.system(["open", FILE.join("Build", "Debug", "WWSCC_Cal_Mgr_Capp", "index.html")]);
});

task ("run-release", ["release"], function()
{
    OS.system(["open", FILE.join("Build", "Release", "WWSCC_Cal_Mgr_Capp", "index.html")]);
});

task ("deploy", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Deployment", "WWSCC_Cal_Mgr_Capp"));
    OS.system(["press", "-f", FILE.join("Build", "Release", "WWSCC_Cal_Mgr_Capp"), FILE.join("Build", "Deployment", "WWSCC_Cal_Mgr_Capp")]);
    printResults("Deployment")
});

task ("desktop", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Desktop", "WWSCC_Cal_Mgr_Capp"));
    require("cappuccino/nativehost").buildNativeHost(FILE.join("Build", "Release", "WWSCC_Cal_Mgr_Capp"), FILE.join("Build", "Desktop", "WWSCC_Cal_Mgr_Capp", "WWSCC_Cal_Mgr_Capp.app"));
    printResults("Desktop")
});

task ("run-desktop", ["desktop"], function()
{
    OS.system([FILE.join("Build", "Desktop", "WWSCC_Cal_Mgr_Capp", "WWSCC_Cal_Mgr_Capp.app", "Contents", "MacOS", "NativeHost"), "-i"]);
});

function printResults(configuration)
{
    print("----------------------------");
    print(configuration+" app built at path: "+FILE.join("Build", configuration, "WWSCC_Cal_Mgr_Capp"));
    print("----------------------------");
}
