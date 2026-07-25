class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "0.3.0"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.3.0/a365dt-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "1b02fe1177d92fb7e8acebf8b8f988cc3c8817ded88b635acb4776645cbadba0"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.3.0/a365dt-v0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "54b72832a0be0c0226b058f69bb12f41e90c85f5da4fccb980bb4c539016cae6"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v0.3.0/a365dt-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "555972c30379f3d0150be03e95925a8856b62f7c9f2c3e0ff250dc121cd90a3b"
    end
  end
  def install
    bin.install "a365dt"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/a365dt --version")
  end
end
