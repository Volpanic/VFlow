/// @description Insert description here
// You can write your code in this editor
draw_set_colour(c_white);

var x1 = 8;
var y1 = room_height- 16 - room_height/4;
var x2 = room_width-8;
var y2 = room_height-8;

draw_rectangle(x1,y1,x2,y2,false);

if(!TextComplete())
{
    TypeWritterTimer++;
    if(TypeWritterTimer >= TypewritterSpeed)
    {
        TypeWritterIndex++;
        TypeWritterTimer = 0;
    }
}

draw_set_color(c_black);
draw_rectangle(x1,y1,x2,y2,true);


draw_set_halign(fa_left);
draw_set_valign(fa_top);

var displayText = string_copy(TextToDisplay,0,TypeWritterIndex);
draw_text_ext(x1+4,y1+4,displayText,16,x2-x1-8);

if(TextComplete())
{
    if(current_second % 2 == 0) draw_circle(x2-8,y2-8,3,false);
}

// This is just for the example
// If you want an actual text box probably just use Scribble by JuJuAdams