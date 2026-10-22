cask "gigamop" do
  version "0.1.3"
  sha256 "f62cc853c270f9d22c8e10a23d20e300a7025ed340e21619bcf23d3e6992e5be"

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
