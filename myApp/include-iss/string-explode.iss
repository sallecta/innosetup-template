[Code]
//http://www.legroom.net/files/software/clihelp.iss
// Split a string into an array using passed delimeter
// Author:			Jared Breland <jbreland@legroom.net>
// Homepage:		http://www.legroom.net/mysoft
// License:			GNU Lesser General Public License (LGPL), version 3
//					http://www.gnu.org/licenses/lgpl.html
procedure Explode(var Dest: TArrayOfString; Text: String; Separator: String);
var
	i: Integer;
begin
	i := 0;
	repeat
		SetArrayLength(Dest, i+1);
		if Pos(Separator,Text) > 0 then	begin
			Dest[i] := Copy(Text, 1, Pos(Separator, Text)-1);
			Text := Copy(Text, Pos(Separator,Text) + Length(Separator), Length(Text));
			i := i + 1;
		end else begin
			 Dest[i] := Text;
			 Text := '';
		end;
	until Length(Text)=0;
end;
