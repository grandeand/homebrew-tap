cask "grandebar" do
  version "0.2.38"
  sha256 "9db080bab0f526e075a02b5366d8f5eb9b22c8f9de13c1d5e7af7b9cde44dc15"

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
