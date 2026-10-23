cask "gigamop" do
  version "0.1.4"
  sha256 "f98e619a5b96aa5afd4524253fc861d18084004786c7bb6d09c5b3722dab5a2b"

  url "https://gigamop.com/download/Gigamop-#{version}.dmg"
  name "Gigamop"
  desc "Disk cleaner for the leftovers of AI-assisted coding"
  homepage "https://gigamop.com/"

  livecheck do
    url "https://gigamop.com/download"
    strategy :header_match
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Gigamop.app"

  uninstall launchctl: "com.gigamop.app.helper",
            quit:      "com.gigamop.app"

  zap trash: [
    "~/Library/Application Support/Gigamop",
    "~/Library/Caches/com.gigamop.app",
    "~/Library/HTTPStorages/com.gigamop.app",
    "~/Library/Preferences/com.gigamop.app.plist",
    "~/Library/Saved Application State/com.gigamop.app.savedState",
  ]
end
