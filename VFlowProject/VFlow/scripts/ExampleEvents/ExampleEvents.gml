// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function Wait(_duration)
{
    // Denotes that this is a cutscne that can be called via the cutscene system
    CUTSCENE_EVENT_DEFINITION
    
    // Event Logic
    CUTSCENE_TIMER++;
    if(CUTSCENE_TIMER >= _duration)
    {
        // Event is done Progress to the next event
        CUTSCENE_NEXT_EVENT
    }
}

function AddTextbox(_text)
{
    // Denotes that this is a cutscne that can be called via the cutscene system
    CUTSCENE_EVENT_DEFINITION
    
    if(CUTSCENE_TIMER == 0)
    {
        // Spawn a textbox object or grab the active one
        var textbox = noone;
        if(instance_exists(obj_textbox)) textbox = obj_textbox;  
        if(textbox == noone) textbox = instance_create_depth(0,0,0,obj_textbox);
            
        // Set the text and increment the timer counter, so we don't run the code multiple times
        textbox.ChangeText(_text);
        CUTSCENE_TIMER = 1;
    }
    else
    {
        if(instance_exists(obj_textbox))
        {
            if(obj_textbox.TextComplete() && mouse_check_button_pressed(mb_left))
            {
                CUTSCENE_NEXT_EVENT
            }
        }
    }
}


// Each set of 2 arguments represents-
// The string that is the text displayed for the option
// The cutscene definition to go to when chosen (Or noone to continue the current definition)
// You can have any number of options 
// E.g AddChoice("Yes",noone,"No",NoEvent,"Maybe",MaybeEvent,"Surprise",choose(noone,NoEvent,MaybeEvent));
function AddChoice(_choiceText1,_choiceEvent1,_choiceText2,_choiceEvent2)
{
	// Denotes that this is a cutscne that can be called via the cutscene system
	CUTSCENE_EVENT_DEFINITION
	
	if(CUTSCENE_TIMER == 0)
	{
		// Get the option text only and send it to created choice object
		var questionCount = ceil(argument_count/2);
		
		var inst = instance_create_depth(0,0,0,obj_choice);
		var options = array_create(questionCount);
		
		for(var i = 0; i < questionCount; i++)
		{
			options[i] = argument[i*2];
		}
		
		inst.SetOptions(options);
		
		CUTSCENE_TIMER = 1;
	}
	else
	{
		// Wait for choice response
		if(instance_exists(obj_choice))
		{
			if(obj_choice.HasSelected)
			{
				var nextEvent = argument[(obj_choice.SelectedIndex*2)+1];
				with(obj_choice){instance_destroy()}
				
				if(nextEvent == noone)
				{
					CUTSCENE_NEXT_EVENT;
					return;
				}
				else
				{
					obj_vflow_cutscene_runner._changeEvent(nextEvent);
				}
			}
		}
	}
}

function CutsceneCloseGame()
{
	CUTSCENE_EVENT_DEFINITION
	
	game_end();
	
	CUTSCENE_NEXT_EVENT
}