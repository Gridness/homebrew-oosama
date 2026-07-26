class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "0.5.0"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.5.0/a365dt-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "7d72c7aa2867eb855c6cc50f657dd00304a87fb41a1a18eb932de085c9100256"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.5.0/a365dt-v0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7d3c5b50e732cfe0fc8b3e2dc3744f7ccff6689d98c60585abb3ddb2b8aef588"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v0.5.0/a365dt-v0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "66eb33ff8842e386cc977dc2dd24ffcb662284d317cce6eae59b685c96ab5ca2"
    end
  end
  def install
    bin.install "a365dt"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/a365dt --version")
  end
end
