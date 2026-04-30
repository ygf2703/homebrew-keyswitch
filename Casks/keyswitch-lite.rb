cask "keyswitch-lite" do
  version "1.0.2"
  sha256 "4b8a8cde063e2efbcdee97a005fbbd9a191701fd69a38c7257f37acfd9d23d17"

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
