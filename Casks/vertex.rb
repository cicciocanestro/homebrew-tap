cask "vertex" do
  version "1.14.0"
  sha256 "99de276799d6d04840964528b5e868050a507f08dfc20c2d41cea52c5495abea"

  url "https://github.com/cicciocanestro/vertex/releases/download/v#{version}/Vertex-#{version}-macOS15.0-arm64.dmg"
  name "Vertex"
  desc "Native BitTorrent client built with SwiftUI and libtorrent"
  homepage "https://github.com/cicciocanestro/vertex"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sequoia"
  depends_on arch: :arm64

  app "Vertex.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Vertex.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Vertex",
    "~/Library/Preferences/app.vertex.torrent.plist",
    "~/Library/Saved Application State/app.vertex.torrent.savedState",
  ]
end
