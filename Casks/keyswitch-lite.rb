cask "keyswitch-lite" do
  version "1.0.3"
  sha256 "3008d42f23a793c2f87d9306a0aad923763d51d4103737d7cb2f73a0e5a028db"

  url "https://download.keyswitch.app/KeySwitch-Lite-mac-#{version}.dmg"
  name "KeySwitch Lite"
  desc "Automatic keyboard layout correction"
  homepage "https://keyswitch.app/"

  livecheck do
    skip "No versioned release feed is available"
  end

  depends_on macos: ">= :ventura"

  app "KeySwitch Lite.app"

  postflight do
    system_command "/usr/bin/open", args: ["-a", "#{appdir}/KeySwitch Lite.app"]
  end

  uninstall quit:       "com.keyswitch.app.lite",
            on_upgrade: :quit

  zap trash: [
    "~/Library/Logs/KeySwitch",
    "~/Library/Preferences/com.keyswitch.app.lite.plist",
  ]
end
