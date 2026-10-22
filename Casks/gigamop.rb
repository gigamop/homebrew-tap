cask "gigamop" do
  version "0.1.2"
  sha256 "04f9a166d6e94fae81c5315516135ed88cf3bffa3e6abcec5352c4fae48e5726"

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
