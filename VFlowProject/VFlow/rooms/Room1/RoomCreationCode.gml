call_later(1,time_source_units_frames,function()
{
    StartCutsceneDefinition();
    
    AddTextbox("Hello, this is an example of the VFlow cutscene system.");
    
    var cut = EndCutsceneDefinition()
    
    RunCutscene(cut);    
})