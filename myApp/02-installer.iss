[Code]
#include "include-iss\pp-string-explode.iss"
#define pp_explode_strText SourcePath
#define myApp pp_explode_arrOut[DimOf(pp_explode_arrOut)-1];

#define installerINIfile SourcePath + '01-installer.ini';
#define myVer1 ReadIni(installerINIfile, 'version', 'version1','error');
#define myVer2 ReadIni(installerINIfile, 'version', 'version2','error');
#define myVer3 ReadIni(installerINIfile, 'version', 'version3','error');
#define myVerFull myVer1 + "." + myVer2 + "." + myVer3;
#if Pos(myVer1, 'error') > 0
	#pragma warning 'Error parsing "' + installerINIfile + '"; (' + 'myVerFull: ' + myVerFull + ')';
	#error Error parsing "{#installerINIfile}". Compilation aborted. See log for details.
#endif
#pragma message 'successfully parsed version info from "' + installerINIfile + '"; (' + 'myVerFull: ' + myVerFull + ')';

#include "include-iss\pp-dir-empty.iss"
#define pp_dirEmpty_mask "programfiles2install\*.*";
#if pp_dirEmpty
	#pragma warning 'programfiles2install directory is empty, creating dummy file from installer source..';
	#expr CopyFile("02-installer.iss", "programfiles2install\dummyfile");
#endif


[Setup]
UsePreviousLanguage=no
Compression=lzma2/max
SolidCompression=yes
AppName={#myApp}
AppVersion={#myVerFull}
DefaultDirName={pf}\{#myApp}
OutputDir={#SourcePath}
OutputBaseFilename={#myApp}-installer

[Files]
Source: "programfiles2install\*"; DestDir: "{app}"; Flags:recursesubdirs
