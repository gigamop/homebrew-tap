cask "gigamop" do
  version "0.1.1"
  sha256 "e3069bab99d04c6b10ced1d5527368c5b068a3e20a1ef5dcf68ff350775bc794"

  url "https://gigamop.com/download/Gigamop-#{version}.dmg"
  name "Gigamop"
  desc "Disk cleaner for the leftovers of AI-assisted coding"
  homepage "https://gigamop.com/"

  livecheck do
    url "https://gigamop.com/download"
    strategy :header_match
  end

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
