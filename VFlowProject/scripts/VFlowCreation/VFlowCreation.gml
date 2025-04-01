
function StartCutsceneDefinition()
{
    var def = new v_CutsceneDefinition();
    ds_stack_push(obj_vflow_cutscene_manager.CutsceneDefinitionStack,def);
}

function EndCutsceneDefinition()
{
    var def = ds_stack_pop(obj_vflow_cutscene_manager.CutsceneDefinitionStack);
    def._built = true;
    return def;
}

function RunCutscene(_cutscene)
{
    var runner = instance_create_depth(0,0,0,obj_vflow_cutscene_runner);
    runner.Cutscene = _cutscene;
}
