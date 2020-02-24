<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Description</key>
    <string>Downloads latest Eko disk image.</string>
    <key>Identifier</key>
    <string>com.github.autopkg.download.Eko</string>
    <key>Input</key>
    <dict>
        <key>NAME</key>
        <string>Eko</string>
        <key>DOWNLOAD_URL</key>
        <string>https://desktop.ekoapp.com/ekos/updates/latest/mac/Eko.dmg</string>
    </dict>
    <key>MinimumVersion</key>
    <string>3.0.4</string>
    <key>Process</key>
    <array>
        <dict>
            <key>Processor</key>
            <string>URLDownloader</string>
            <key>Arguments</key>
            <dict>
                <key>url</key>
                <string>%DOWNLOAD_URL%</string>
                <key>filename</key>
                <string>%NAME%.dmg</string>
            </dict>
        </dict>
        <dict>
            <key>Processor</key>
            <string>EndOfCheckPhase</string>
        </dict>
        <dict>
            <key>Processor</key>
            <string>CodeSignatureVerifier</string>
            <key>Arguments</key>
            <dict>
                <key>input_path</key>
                <string>%pathname%/Eko.app</string>
                <key>requirement</key>
            </dict>
        </dict>
    </array>
</dict>
</plist>
