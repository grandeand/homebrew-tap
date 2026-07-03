cask "grandebar" do
  version "0.1.5"
  sha256 "32e596e0041b30f97eedd7f8b68eec14fdf3a8a0832464e3dfcc3f74c28aafe7"

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
    GrandeBar is currently unsigned.

    If macOS says the app is damaged or should be moved to Trash, run:
      xattr -dr com.apple.quarantine /Applications/GrandeBar.app

    You can also install without quarantine:
      brew install --cask --no-quarantine grandeand/tap/grandebar
  EOS

  zap trash: [
    "~/Library/Preferences/co.grande.grandebar.plist",
  ]
end
