/// @description Insert description here
// You can write your code in this editor
Options = ["Not Set"];
SelectedIndex = 0;
HasSelected = false;

BoxWidth = 128;
BoxHeight = 128;
LineHeight = 8;

Padding = 8;

function SetOptions(_optionsArray)
{
    Options = _optionsArray;
    
    var width = string_width(Options[0]);
    var height = string_height(Options[0]);
    
    for(var i = 1; i < array_length(Options); i++)
    {
        width = max(width,string_width(Options[i]));
        height = max(height,string_height(Options[i]));
    }
    
    BoxWidth = width+(Padding*2);
    BoxHeight = (height*(array_length(Options)))+(Padding*2);
    LineHeight = height;
}

SetOptions(["yes","NO!!!!!!!!!!!!!"])