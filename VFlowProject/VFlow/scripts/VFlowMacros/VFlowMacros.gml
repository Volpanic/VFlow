
#macro CUTSCENE_NEXT_EVENT obj_vflow_cutscene_runner._nextScene();
#macro CUTSCENE_TIMER obj_vflow_cutscene_runner.EventTimer

// Loop through the argument array and copy it's contents
#macro v_arg_array var v_ArgumentArrayStorage = array_create(argument_count) \
for(var i = 0; i < argument_count; i++) \
{\
    v_ArgumentArrayStorage[i] = argument[i]\
}

// Adds the current call to the definition stack
// then exits the calling function if it's the definition
#macro CUTSCENE_EVENT_DEFINITION {\
    var cur = ds_stack_top(obj_vflow_cutscene_manager.CutsceneDefinitionStack); \
    if(!is_undefined(cur) && !cur._built) \
    {\
        v_arg_array\
        cur.LogEvent(asset_get_index(v_GetCurrentFunction()),v_ArgumentArrayStorage)\
        return\
    }\
} 


// NOTE the \ at the end of each line just makes it so I don't have to write the macros on 1 line