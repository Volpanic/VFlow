<p align="center">
  <img  style="height: 200px;" src="https://github.com/Volpanic/VFlow/blob/main/img/Logo.png?raw=true" alt="VFlow Logo"/>
</p>

# VFlow 
Scriptable cutscene system for GameMaker

## Installation
Download the latest .yymps from the [Release Page](https://github.com/Volpanic/VFlow/releases) and import it into your GameMaker project by selecting
Tools->Import Local Package and then selecting the .yymps file.

You can choose to import the VFlowExample for a quick demonstration of how the system can be used.

## Usage

### Setup
Place the ***obj_vflow_cutscene_manager*** in the starting room of your game, The object is persistent so it only needs to be placed once.

### Defining Cutscenes
To start defining a cutscene call ***StartCutsceneDefinition*** then call all the cutscene events in the definition and call ***EndCutsceneDefinition*** It will return the defined cutscene struct store this in a varaible and use the RunCutscene() function to start the cutscene.

*Here's an example-*
```gml
StartCutsceneDefinition();

Event0();
Event1();
Event2();
...

var cutscene = EndCutsceneDefinition();

RunCutscene(cutscene); 
```

### Cutscene Events
VFlow is just the cutscene system, It comes with no preloaded events (Except for in VFlowExample)

VFlow events are functions that call the ***CUTSCENE_EVENT_DEFINITION*** macro at the start of the event, They also need to call the ***CUTSCENE_NEXT_EVENT*** macro to let the cutscene system know to move to the next event.

*Here's an example-*
```gml
function ExampleEvent()
{
    // Denotes that this is a cutscene that can be called via the cutscene system
    CUTSCENE_EVENT_DEFINITION

    // Logic for the cutscene event

    // Event is done progress to the next event
    CUTSCENE_NEXT_EVENT
}
```

VFlow also provides the macro ***CUTSCENE_TIMER*** that can be used to keep track of internal progress of an event. It resets to 0 when ***CUTSCENE_NEXT_EVENT*** is called. 

*Here's an example of it in use-*
```gml
function Wait(_duration)
{
    // Denotes that this is a cutscene that can be called via the cutscene system
    CUTSCENE_EVENT_DEFINITION
    
    // Event Logic
    CUTSCENE_TIMER++;
    if(CUTSCENE_TIMER >= _duration)
    {
        // Event is done Progress to the next event
        CUTSCENE_NEXT_EVENT
    }
}
```

### Complete Example of Definition
Here's an example of a cutscene defintion from the game I'm working on, **Keep in mind the events called internally are not included with the project,** you have to create the events suited to your project.
```gml
StartCutsceneDefinition();

FreezePlayer();
CutsceneHealPlayer();
AddDialouge("A glimmer or Lim's magic shines within the crystal ball.");
AddDialouge("Would you like to save?");
Choice("Yes",noone,"No",SaveNoEvent);
CloseDialouge();
CutsceneSaveGame();
PlaySaveEffect();
Wait(30);
AddDialouge("Progress has been saved.");
UnfreezePlayer();

SaveCutscene = EndCutsceneDefinition();
```

## Other Notes
I've only tested this on windows platforms and I'm not sure if it runs perfeectly on other platforms. I see no exact reason why it shouldn't but if it doesn't, let me know I'll see what I can do.

## Support
If you like this project and want to support me, the biggest thing you can do right now it wishlisting my game on steam!
[Greenhouse: Schism](https://store.steampowered.com/app/3496980/Greenhouse_Schism/)

Also check out-
[My Youtube](https://www.youtube.com/@Volpanic),
[My Bluesky](https://bsky.app/profile/volpanic.bsky.social),
[My Other Youtube for music stuff](https://www.youtube.com/@ClamShandy)

Thanks for checking out this project!
