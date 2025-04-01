// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function v_GetCurrentFunction()
{
    // Grab the current calling function from the callstack
    var currentCall = debug_get_callstack(2)[1];
    
    // Remove gml_Script from the strings start
    currentCall = string_delete(currentCall,0,11);
    
    // Remove line track from string
    currentCall = string_split(currentCall,":")[0];
    
    return currentCall;
    
}