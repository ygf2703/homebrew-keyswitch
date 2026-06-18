cask "keyswitch" do
  version "1.0.10"
  sha256 "c58d9eaac3e6777821fdf28f09e7d7ca8107794dc7ffb3136c58b579566a404f"

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
