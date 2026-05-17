[Setup]
AppName=Eugene
AppVersion=0.513
DefaultDirName={commonpf}\Eugene
OutputBaseFilename=Eugene-Setup

[Files]
Source: "Eugene.otf"; DestDir: "{fonts}"; FontInstall: "Eugene"
Source: "EugeneText.otf"; DestDir: "{fonts}"; FontInstall: "Eugene Text"
Source: "Eugene.json"; DestDir: "{commonappdata}\SMuFL\Fonts\Eugene"