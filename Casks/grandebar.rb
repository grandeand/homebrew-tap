cask "grandebar" do
  version "0.2.19"
  sha256 "a021738da3827d559eff27ce321ddbb4b95dcb7cf1382b8cdd03e8bca418a7a8"

  url "https://github.com/grandeand/grandebar/releases/download/v#{version}/GrandeBar-#{version}.zip"
  name "GrandeBar"
  desc "Native macOS menu bar app for CLIProxyAPI Codex and Claude quota and cost"
  homepage "https://github.com/grandeand/grandebar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "GrandeBar.app"

  caveats <<~EOS
    GrandeBar is currently unsigned.

    If macOS says the app is damaged or should be moved to Trash, run:
      xattr -dr com.apple.quarantine /Applications/GrandeBar.app
  EOS

  zap trash: [
    "~/Library/Preferences/co.grande.grandebar.plist",
  ]
end
