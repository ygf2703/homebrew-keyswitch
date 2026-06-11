cask "keyswitch" do
  version "1.0.9"
  sha256 "3250bb78fb73000467a0bc115829b64f0b631fedc3a4944759cfb19f5b03a51d"

  url "https://download.keyswitch.app/KeySwitch-mac-#{version}.dmg"
  name "KeySwitch"
  desc "Automatic keyboard layout correction"
  homepage "https://keyswitch.app/"

  livecheck do
    skip "No versioned release feed is available"
  end

  depends_on macos: :ventura

  app "KeySwitch.app"

  postflight do
    system_command "/usr/bin/open", args: ["-a", "#{appdir}/KeySwitch.app"]
  end

  uninstall quit: "com.keyswitch.app"

  zap trash: [
    "~/Library/Logs/KeySwitch",
    "~/Library/Preferences/com.keyswitch.app.plist",
  ]
end
