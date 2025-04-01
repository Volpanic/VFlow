/// @description Insert description here
// You can write your code in this editor
var centerX = room_width/2;
var centerY = room_height/2;

var x1 = centerX - BoxWidth/2;
var y1 = centerY - BoxHeight/2;
var x2 = centerX + BoxWidth/2;
var y2 = centerY + BoxHeight/2;

draw_set_color(c_white);

draw_rectangle(x1,y1,x2,y2,false);

draw_set_halign(fa_middle);
draw_set_valign(fa_middle);

draw_set_color(c_black);

for(var i = 0; i < array_length(Options); i++)
{
    var startY = y1+Padding;
    var yy = startY+(LineHeight*i)+(LineHeight*.5);
    
    draw_text(centerX,yy,Options[i]);
    
    // Rectangle Detection
    var mx1 = x1 + Padding;
    var mx2 = x2 - Padding;
    var my1 = yy-(LineHeight*.5);
    var my2 = yy+(LineHeight*.5);
    
    if(point_in_rectangle(mouse_x,mouse_y,mx1,my1,mx2,my2))
    {
        draw_set_alpha(.5);
        draw_rectangle(mx1,my1,mx2,my2,false);
        draw_set_alpha(1);
		
		if(mouse_check_button_pressed(mb_left))
		{
			SelectedIndex = i;
			HasSelected = true;
		}
    }
}

