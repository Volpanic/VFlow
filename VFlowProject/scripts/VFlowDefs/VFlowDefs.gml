// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function v_FunctionLog(_scr,_args) constructor
{
    _function = _scr;
    _arguments = _args;
}

function v_CutsceneDefinition() constructor
{
    // Store Functions
    _events = array_create(0,0);
    
    // If the cutscene has finished being built (Cutscene Definition Ended)
    _built = false;
    
    // Adds the function to the definition
    function LogEvent(_scr,_args)
    {
        array_push(_events,new v_FunctionLog(_scr,_args));
    }
}
