; Eugene Music Font - Windows Installer
; Inno Setup Script
; Non-commercial use only
; https://mikkopatama.com/eugenefont

#include <idp.iss>

; AppVersion is passed from GitHub Actions as:
; iscc /DAppVersion=${{ steps.get_tag.outputs.NEWEST_RELEASE_TAG_NAME }}
; Fallback value must be a valid existing GitHub release tag
#ifndef AppVersion
  #define AppVersion "1.251"
#endif

#define MyAppName "Eugene Music Font"
#define MyAppVersion AppVersion
#define MyAppPublisher "Mikko Patama"
#define MyAppURL "https://mikkopatama.com/eugenefont"

; ── Setup ─────────────────────────────────────────────────────────────────────

[Setup]
AppId={{DC5F19DB-B324-43CE-B85C-1752AAAB8A57}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
AppCopyright=Mikko Patama 2026
DefaultDirName={autopf}
DefaultGroupName={#MyAppName}
DisableDirPage=yes
DisableProgramGroupPage=yes
OutputBaseFilename=Eugene-Win-{#MyAppVersion}
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64compatible
PrivilegesRequired=admin
PrivilegesRequiredOverridesAllowed=dialog
ChangesAssociations=no
Uninstallable=no
CreateAppDir=False
RestartIfNeededByRun=False
ShowLanguageDialog=no
RestartApplications=False
VersionInfoVersion={#MyAppVersion}
WizardStyle=classic dynamic

; ── Languages ─────────────────────────────────────────────────────────────────

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

; ── Files ─────────────────────────────────────────────────────────────────────
; Files are downloaded from GitHub release by IDP (see InitializeWizard below)
; and placed in {tmp} before installation. The 'external' flag tells Inno Setup
; to read them from {tmp} rather than from the compiler's source directory.

[Files]

; Fonts → system font directory (C:\Windows\Fonts)
Source: "{tmp}\Eugene.otf"; \
    DestDir: "{commonfonts}"; \
    Flags: restartreplace ignoreversion external

Source: "{tmp}\EugeneText.otf"; \
    DestDir: "{commonfonts}"; \
    Flags: restartreplace ignoreversion external

; SMuFL metadata → Dorico system-wide path
; (C:\Program Files\Common Files\SMuFL\Fonts\Eugene\)
Source: "{tmp}\Eugene.json"; \
    DestDir: "{commoncf}\SMuFL\Fonts\Eugene"; \
    Flags: ignoreversion createallsubdirs external

; SMuFL metadata + fonts → MuseScore 4
; (C:\Users\[user]\Documents\MuseScore4\MusicFonts\Eugene\)
Source: "{tmp}\Eugene.json"; \
    DestDir: "{userdocs}\MuseScore4\MusicFonts\Eugene"; \
    Flags: ignoreversion createallsubdirs external

Source: "{tmp}\Eugene.otf"; \
    DestDir: "{userdocs}\MuseScore4\MusicFonts\Eugene"; \
    Flags: restartreplace ignoreversion external

Source: "{tmp}\EugeneText.otf"; \
    DestDir: "{userdocs}\MuseScore4\MusicFonts\Eugene"; \
    Flags: restartreplace ignoreversion external

; ── Registry ──────────────────────────────────────────────────────────────────
; Register fonts system-wide in HKLM so all users and applications see them

[Registry]
Root: HKLM; \
    Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"; \
    ValueType: string; \
    ValueName: "Eugene (OpenType)"; \
    ValueData: "Eugene.otf"; \
    Flags: uninsdeletevalue

Root: HKLM; \
    Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"; \
    ValueType: string; \
    ValueName: "EugeneText (OpenType)"; \
    ValueData: "EugeneText.otf"; \
    Flags: uninsdeletevalue

; ── Code ──────────────────────────────────────────────────────────────────────

[Code]

{ Windows API: register font with GDI }
function AddFontResourceEx(lpFileName: string; fl: cardinal; pdv: cardinal): cardinal;
  external 'AddFontResourceExW@Gdi32.dll stdcall';

{ Windows API: broadcast WM_FONTCHANGE so running apps see new fonts immediately }
function SendMessageTimeout(hWnd: cardinal; Msg: cardinal; wParam: cardinal;
  lParam: cardinal; fuFlags: cardinal; uTimeout: cardinal;
  var lpdwResult: cardinal): cardinal;
  external 'SendMessageTimeoutW@User32.dll stdcall';

{ Register a single font file and notify all running applications }
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
  { Broadcast WM_FONTCHANGE (0x001D) to all windows }
  SendMessageTimeout($FFFF, $001D, 0, 0, 0, 1000, res);
end;

{ Download release files from GitHub before installation begins }
procedure InitializeWizard();
var
  gitURL: string;
begin
  gitURL := 'https://github.com/mikkopatama/eugenefont/releases/download/'
            + ExpandConstant('{#MyAppVersion}') + '/';
  idpAddFile(gitURL + 'Eugene.json',    ExpandConstant('{tmp}\Eugene.json'));
  idpAddFile(gitURL + 'EugeneText.otf', ExpandConstant('{tmp}\EugeneText.otf'));
  idpAddFile(gitURL + 'Eugene.otf',     ExpandConstant('{tmp}\Eugene.otf'));
  idpDownloadAfter(wpReady);
end;

{ After files are installed, register fonts with GDI so no reboot is needed }
procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    RegisterFont('Eugene.otf');
    RegisterFont('EugeneText.otf');
  end;
end;
