cask "grandebar" do
  version "0.1.0"
  sha256 "2c6b521f8c3efd556615019e34713156fa34e526b23f6c743db542de724042ff"

  url "https://github.com/grandeand/grandebar/releases/download/v#{version}/GrandeBar-#{version}.zip"
  name "GrandeBar"
  desc "Native macOS menu bar app for CLIProxyAPI Codex quota and ccusage cost"
  homepage "https://github.com/grandeand/grandebar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "GrandeBar.app"

  caveats <<~EOS
    GrandeBar is currently unsigned. If macOS blocks the first launch,
    open it once from Finder with right click, then Open.
  EOS

  zap trash: [
    "~/Library/Preferences/co.grande.grandebar.plist",
  ]
end
