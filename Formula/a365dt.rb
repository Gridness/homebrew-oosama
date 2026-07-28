class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "0.7.1"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.7.1/a365dt-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "81b5dde147064c08e9446cf9e66aa6c094ce8726d763abfa88bc98526f034ba1"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.7.1/a365dt-v0.7.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e0af5b296b452c6972889ec4882c8f63a9c19d6d928705e174ce3d49998b54fa"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v0.7.1/a365dt-v0.7.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "06837f0459ce2932423a0c16524f8f3bfc1882e678bf1f0c050b978c5e0d6d19"
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
