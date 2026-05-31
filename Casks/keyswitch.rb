cask "keyswitch" do
  version "1.0.8"
  sha256 "e48aeae5a3dce2fe79cf33b01c8f9af27477b56b367111e857c259a47e4638af"

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
