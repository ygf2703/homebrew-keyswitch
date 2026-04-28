cask "keyswitch-lite" do
  version "1.0.0"
  sha256 "78c28e50d75dbc3090296dc28bb26a85eef36e409d3f4e761b835a94a3535658"

  url "https://download.keyswitch.app/KeySwitch-Lite-mac-#{version}.dmg"
  name "KeySwitch Lite"
  desc "Automatic keyboard layout correction"
  homepage "https://keyswitch.app/"

  livecheck do
    skip "No versioned release feed is available"
  end

  depends_on macos: ">= :ventura"

  app "KeySwitch Lite.app"

  zap trash: [
    "~/Library/Logs/KeySwitch",
    "~/Library/Preferences/com.keyswitch.app.lite.plist",
  ]
end
