cask "vertex" do
  version "1.17.10"
  sha256 "231ce1e0b9d95877fc9aa46ea30ac3e68012b436075030aacbd8e7f15deb4183"

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
