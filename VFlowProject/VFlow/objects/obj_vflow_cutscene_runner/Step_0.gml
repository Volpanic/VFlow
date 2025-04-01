/// @description Insert description here
// You can write your code in this editor

// Keep is tracked so multiple cutscenes functions can run on 1 frame
KeepGoing = true;

while(KeepGoing && EventIndex < array_length(Cutscene._events))
{
    KeepGoing = false;
    var currentEvent = Cutscene._events[EventIndex];
    script_execute_ext(currentEvent._function,currentEvent._arguments);
}

if(EventIndex >= array_length(Cutscene._events))
{
    instance_destroy();
}
