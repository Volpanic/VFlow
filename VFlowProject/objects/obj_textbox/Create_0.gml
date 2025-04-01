/// @description Insert description here
// You can write your code in this editor
TypewritterSpeed = 2;
TypeWritterIndex = 0;
TypeWritterTimer = 0;

TextToDisplay = "No Set Text";

function ChangeText(_text)
{
    TextToDisplay = _text;
    TypeWritterIndex = 0;
    TypeWritterTimer = 0;
}

function TextComplete()
{
    return TypeWritterIndex == string_length(TextToDisplay);
}