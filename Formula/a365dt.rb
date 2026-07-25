class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "0.4.0"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.4.0/a365dt-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "aa7c110031c5e55c103287d9db923b5e67484d97845955296f7fbe4aa46723e1"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.4.0/a365dt-v0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cfc241b71ca7d818e6a0574753288b8f19d06c836bbce76975fa2f34110ac4aa"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v0.4.0/a365dt-v0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "19c30d69ab870e84f17d363fbcb7151603a0010020c07ba6bdea4e3fb5c7c5a7"
    end
  end
  def install
    bin.install "a365dt"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/a365dt --version")
  end
end
