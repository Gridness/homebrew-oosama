class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "0.1.0"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.1.0/a365dt-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "1314697087b122299d0f729a492e08ec3272ce27dfaaea23b6defc834e654789"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.1.0/a365dt-v0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "934904d1b3df04551e1dd6c249e64d49bb0e13e1ebe09beee5c86302f4149910"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v0.1.0/a365dt-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "119b8c5014166a14d0804c412db6721a92eebd6efb5d97c6c972a658a269214e"
    end
  end
  def install
    bin.install "a365dt"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/a365dt --version")
  end
end
