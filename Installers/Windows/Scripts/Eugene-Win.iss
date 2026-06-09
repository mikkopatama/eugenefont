[Setup]
AppName=Eugene Music Font
AppVersion=1.251
DisableProgramGroupPage=yes
DefaultGroupName=Eugene
OutputBaseFilename=Eugene-Win-1.251
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64compatible
PrivilegesRequired=admin
ChangesAssociations=no
Uninstallable=no
CreateAppDir=False
AppCopyright=Mikko Patama 2026
RestartIfNeededByRun=False
ShowLanguageDialog=no
AppPublisherURL=https://mikkopatama.com/eugenefont
RestartApplications=False
VersionInfoVersion=1.251
AppPublisher=Mikko Patama

[Files]
Source: "..\eugenefont-1.2\eugenefont-1.2\Font files\Eugene.otf"; DestDir: "{commonfonts}"; Flags: restartreplace ignoreversion
Source: "..\eugenefont-1.2\eugenefont-1.2\Font files\EugeneText.otf"; DestDir: "{commonfonts}"; Flags: restartreplace ignoreversion
Source: "..\eugenefont-1.2\eugenefont-1.2\Font files\Eugene.json"; DestDir: "{commoncf}\SMUFL\Fonts\Eugene"; Flags: ignoreversion createallsubdirs recursesubdirs

[Registry]
Root: "HKLM"; \
    Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"; \
    ValueType: string; \
    ValueName: "Eugene (OpenType)"; \
    ValueData: "Eugene.otf"; \
    Flags: uninsdeletevalue
Root: "HKLM"; \
    Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"; \
    ValueType: string; \
    ValueName: "EugeneText (OpenType)"; \
    ValueData: "EugeneText.otf"; \
    Flags: uninsdeletevalue

[Icons]
; no shortcuts or uninstall icon

[Code]
function AddFontResourceEx(lpFileName: string; fl: cardinal; pdv: cardinal): cardinal;
  external 'AddFontResourceExW@Gdi32.dll stdcall';
function SendMessageTimeout(hWnd: cardinal; Msg: cardinal; wParam: cardinal; lParam: cardinal;
  fuFlags: cardinal; uTimeout: cardinal; var lpdwResult: cardinal): cardinal;
  external 'SendMessageTimeoutW@User32.dll stdcall';

procedure RegisterFont(FontFileName: string);
var
  FullPath: string;
  r: cardinal;
  res: cardinal;
begin
  FullPath := ExpandConstant('{commonfonts}\') + FontFileName;
  Log('Registering font: ' + FullPath);
  r := AddFontResourceEx(FullPath, 0, 0);
  if r = 0 then
    Log('AddFontResourceEx returned 0 for ' + FullPath)
  else
    Log('AddFontResourceEx succeeded for ' + FullPath);
  SendMessageTimeout($FFFF, $001D, 0, 0, 0, 1000, res); // WM_FONTCHANGE
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    RegisterFont('Eugene.otf');
    RegisterFont('EugeneText.otf');
  end;
end;
