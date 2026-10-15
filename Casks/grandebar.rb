cask "grandebar" do
  version "0.2.28"
  sha256 "91a8b7a5391b8da1146f0cb95e7db506d4cd2d4950c1a4ebb244ab16445be5b2"

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
