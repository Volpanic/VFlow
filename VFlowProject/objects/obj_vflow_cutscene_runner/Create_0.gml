/// @description Insert description here
// You can write your code in this editor
Cutscene = noone;
EventIndex = 0;
EventTimer = 0;

KeepGoing = true;

// Go to next logged function and reset variables
function _nextScene()
{
    EventIndex++;
    KeepGoing = true;
    EventTimer = 0;
}

// Starts a new definition
function _changeEvent(_newEvent)
{
    Cutscene = _newEvent;
    EventIndex = 0;
    EventTimer = 0;
    KeepGoing = true;
}
