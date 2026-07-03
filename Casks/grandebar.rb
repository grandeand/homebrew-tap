cask "grandebar" do
  version "0.1.4"
  sha256 "2f4de12f1febafd98c15b96fe4f33422d0f3f6b708ac3d1683550e5c42e85cfd"

  url "https://github.com/grandeand/grandebar/releases/download/v#{version}/GrandeBar-#{version}.zip"
  name "GrandeBar"
  desc "Native macOS menu bar app for CLIProxyAPI Codex quota and ccusage cost"
  homepage "https://github.com/grandeand/grandebar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "GrandeBar.app"

  caveats <<~EOS
    GrandeBar is currently unsigned. If macOS blocks the first launch,
    open it once from Finder with right click, then Open.
  EOS

  zap trash: [
    "~/Library/Preferences/co.grande.grandebar.plist",
  ]
end
