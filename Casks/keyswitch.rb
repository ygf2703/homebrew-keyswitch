cask "keyswitch" do
  version "1.0.0"
  sha256 "ffac8baf40920190be0013c442cf42a563e4edb316676c5601740884c23c40b6"

  url "https://download.keyswitch.app/KeySwitch-mac-#{version}.dmg"
  name "KeySwitch"
  desc "Automatic keyboard layout correction for macOS"
  homepage "https://keyswitch.app/"

  depends_on macos: ">= :ventura"

  app "KeySwitch.app"

  zap trash: [
    "~/Library/Logs/KeySwitch",
    "~/Library/Preferences/com.keyswitch.app.plist",
  ]
end
