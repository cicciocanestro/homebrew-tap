cask "vertex" do
  version "1.17.11"
  sha256 "a742f52568308bc6042909c680553d0ce13634ff9a5a341e184b70ee0264431a"

  url "https://github.com/cicciocanestro/vertex/releases/download/v#{version}/Vertex-#{version}-macOS15.0-arm64.dmg"
  name "Vertex"
  desc "Native BitTorrent client built with SwiftUI and libtorrent"
  homepage "https://github.com/cicciocanestro/vertex"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Vertex.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "Vertex.app"],
        base: :appdir
  end

  zap trash: [
    "~/Library/Application Support/Vertex",
    "~/Library/Preferences/app.vertex.torrent.plist",
    "~/Library/Saved Application State/app.vertex.torrent.savedState",
  ]
end
