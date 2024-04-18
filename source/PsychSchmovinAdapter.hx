package;

import flixel.FlxG;
import schmovin.SchmovinAdapter;
import schmovin.SchmovinUtil;

// Psych Schmovin Adapter
class PsychSchmovinAdapter extends SchmovinAdapter
{
        override function forEveryMod(param:Array<Dynamic>)
        {
            trace(param);
        }
    
        // setting this to use the crotchet fucks up the rendering ??? (it renders double sustains for whatever reason but idgaf atp)
        override function getCrotchetAtTime(time:Float):Float
        {
            return 2.0;
        }
    
        override function grabScrollSpeed():Float
        {
            return PlayState.SONG.speed;
        }
    
        override function getCrotchetNow():Float
        {
            return Conductor.crochet;
        }
    
        override function getSongPosition():Float
        {
            return Conductor.songPosition;
        }
    
        override function getDefaultNoteX(column:Int, player:Int)
        {
            var playerColumn = column % 4;
            return SchmovinUtil.getNoteWidthHalf() + 82 + playerColumn * Note.swagWidth + FlxG.width / 2 * player;
        }
    
        override function log(string:Dynamic)
        {
            trace('[Schmovin\' Psych Adapter] $string');
        }
}