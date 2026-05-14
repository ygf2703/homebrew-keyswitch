cask "keyswitch" do
  version "1.0.6"
  sha256 "6a24e79b22df71916d2cd0d1c96928c66f2a401a1d6e10d83d83639276b1ca4e"

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
