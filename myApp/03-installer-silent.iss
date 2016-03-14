#include "include-iss\pp-string-explode.iss"
#define pp_explode_strText SourcePath
#define baseName pp_explode_arrOut[DimOf(pp_explode_arrOut)-1];
#define srcBaseName baseName + '-installer';
#define srcApp srcBaseName + '.exe';
#define silentBaseName srcBaseName + '-silent';
#define silentApp silentBaseName + '.exe';
[Code]

function InitializeSetup: Boolean;
var
	ResultCode: Integer;
begin
	ExtractTemporaryFile('{#srcApp}');
	Exec(ExpandConstant('{tmp}\{#srcApp}'), '/SILENT', '', SW_SHOW, ewWaitUntilTerminated, ResultCode)
	Result := True;
	Abort();
end; //InitializeSetup

[Setup]
Compression = lzma2/ultra
AppName = {#silentBaseName}
AppVersion = 1
DefaultDirName={pf}\{#silentBaseName}
OutputDir={#SourcePath}
OutputBaseFilename={#silentBaseName}
[Files]
Source: {#srcApp}; Flags: dontcopy noencryption