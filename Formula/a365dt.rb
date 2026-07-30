class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "0.11.0"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.11.0/a365dt-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "5d7c4ad7b780deb59a9cc3420775f33e06667530f793ca1d9da18ea37524e849"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.11.0/a365dt-v0.11.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "79555fddd706daa51c509d1c7678ae90f8a6fc06b8a580302282545b8cfa9ce0"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v0.11.0/a365dt-v0.11.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "40ee364bce9863df66d0d15d31ff2687cf17fc8b59960f676ad1fd7733f2d5e4"
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
