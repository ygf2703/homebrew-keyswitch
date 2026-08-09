cask "keyswitch" do
  version "1.0.11"
  sha256 "19a5232ffecec0ad4243c9a50c6987403d94c24b2c1cb8859166e1d3ad994d6a"

  url "https://download.keyswitch.app/KeySwitch-mac-#{version}.dmg"
  name "KeySwitch"
  desc "Automatic keyboard layout correction"
  homepage "https://keyswitch.app/"

  livecheck do
    skip "No versioned release feed is available"
  end

  depends_on macos: :ventura

  app "KeySwitch.app"

  postflight_steps do
    run "/usr/bin/open", args: ["-a", "{{appdir}}/KeySwitch.app"]
  end

  uninstall quit: "com.keyswitch.app"

  zap trash: [
    "~/Library/Logs/KeySwitch",
    "~/Library/Preferences/com.keyswitch.app.plist",
  ]
end
