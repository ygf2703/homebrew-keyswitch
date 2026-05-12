cask "keyswitch-lite" do
  version "1.0.5"
  sha256 "259a7d892266071ad59e21fb2afb6185057f99f10e55d2cf442b71901dc919bb"

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
