cask "grandebar" do
  version "0.2.18"
  sha256 "87432b81d627f162ae81ab76f3de0f2f59b0a29a503c0d8c78805d149f8e6f5f"

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
