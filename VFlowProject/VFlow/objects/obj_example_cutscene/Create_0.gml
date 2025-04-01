/// @

// No Event Cutscene
StartCutsceneDefinition();

AddTextbox("Ok...");
AddTextbox("I suppose this is it then.");
AddTextbox("Goodbye :(");
CutsceneCloseGame();

NoEvent = EndCutsceneDefinition();

// Main Cutscene
StartCutsceneDefinition();
    
AddTextbox("Hello, this is an example of the VFlow cutscene system.");
AddTextbox("VFlow is a tool for creating script based cutscenes in GameMaker.");
AddTextbox("Would you like to learn more?");
AddChoice("Yes",noone,"No",NoEvent);
AddTextbox("Great! But to be real with you the best way to learn more is to open me up!");
AddTextbox("Open the obj_example_cutscene and see how I'm defined, Check the ExampleEvents all that stuff.");
AddTextbox("Thanks for stopping by it's much appreciated!");
CutsceneCloseGame();

var cut = EndCutsceneDefinition()
    
RunCutscene(cut);    