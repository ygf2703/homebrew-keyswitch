cask "keyswitch" do
  version "1.0.5"
  sha256 "e7b5dc674ef79434a311430fdc9901911113d5956d2b409604afaf39ba25be94"

  url "https://download.keyswitch.app/KeySwitch-mac-#{version}.dmg"
  name "KeySwitch"
  desc "Automatic keyboard layout correction"
  homepage "https://keyswitch.app/"

  livecheck do
    skip "No versioned release feed is available"
  end

  depends_on macos: ">= :ventura"

  app "KeySwitch.app"

  postflight do
    system_command "/usr/bin/open", args: ["-a", "#{appdir}/KeySwitch.app"]
  end

  uninstall quit:       "com.keyswitch.app",
            on_upgrade: :quit

  zap trash: [
    "~/Library/Logs/KeySwitch",
    "~/Library/Preferences/com.keyswitch.app.plist",
  ]
end
