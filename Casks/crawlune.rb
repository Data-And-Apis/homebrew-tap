cask "crawlune" do
  arch arm: "arm64", intel: "x64"

  version "0.9.0"
  sha256 arm:   "b9a8836f890edd5d946aa0824b5d60bdaaefd8bec4f485f85345382e9a643ff7",
         intel: "36d1b299b6c5a519feb1b822b38accec7ab13aeec680bf49e2e4de287afdcc30"

  url "https://crawlune.com/api/download/#{version}/macos-#{arch}"
  name "Crawlune"
  desc "Desktop SEO crawler for technical audits"
  homepage "https://crawlune.com/"

  livecheck do
    url "https://crawlune.com/api/releases/latest"
    regex(/"version"\s*:\s*"(\d+(?:\.\d+)+)"/i)
  end

  auto_updates true
  depends_on macos: :monterey

  app "Crawlune.app"
  binary "#{appdir}/Crawlune.app/Contents/MacOS/crawlune"

  zap trash: [
    "~/Library/Application Support/app.crawlune.desktop",
    "~/Library/Caches/app.crawlune.desktop",
    "~/Library/Logs/app.crawlune.desktop",
    "~/Library/Preferences/app.crawlune.desktop.plist",
    "~/Library/Saved Application State/app.crawlune.desktop.savedState",
    "~/Library/WebKit/app.crawlune.desktop",
  ]
end
