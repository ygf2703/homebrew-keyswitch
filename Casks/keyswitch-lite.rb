cask "keyswitch-lite" do
  version "1.0.6"
  sha256 "f0f9cc8f3f0eb54fad82600be816c6e545e946363142aee7cb32255520d3cddf"

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
