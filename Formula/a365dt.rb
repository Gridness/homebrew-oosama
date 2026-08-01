class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "2.3.0"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v2.3.0/a365dt-v2.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "5f0aa25339cc1d95f57d2d73c84c322068cb0396738980e1cb8e4a6166f9dd6e"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v2.3.0/a365dt-v2.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "629e68b90c094ddf75842a7995be771cbe39616eb05eb2abf9a23ee4a2a437e5"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v2.3.0/a365dt-v2.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e3d56c82d89306982270caffedd0be96738632c0bfa75c09860410af71289fe4"
    end
  end
  def install
    bin.install "a365dt"
    generate_completions_from_executable bin/"a365dt", "completions"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/a365dt --version")
  end
end
