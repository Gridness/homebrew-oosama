class Spacetime < Formula
  desc "Command-line interface for SpacetimeDB"
  homepage "https://spacetimedb.com"
  version "2.8.0"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/clockworklabs/SpacetimeDB/releases/download/v2.8.0/spacetime-aarch64-apple-darwin.tar.gz"
    sha256 "775118fc58f3ba478c641f75814707603f91e8fa39d6d12e1d5327075649aad1"
  else
    url "https://github.com/clockworklabs/SpacetimeDB/releases/download/v2.8.0/spacetime-x86_64-apple-darwin.tar.gz"
    sha256 "b89e94cf8c85d05d7b8a44d3e714198c41c1a52509477a94d60c11e39331f9d9"
  end

  def caveats
    <<~EOS
      This formula uses Homebrew for SpacetimeDB version management.
      Upgrade with:

        brew upgrade spacetime

      SpacetimeDB stores user configuration and local database data
      outside the Homebrew prefix. These are intentionally preserved
      when the formula is uninstalled.

      Default locations:

        ~/.config/spacetime
        ~/.local/share/spacetime/data

      If you previously used the official SpacetimeDB installer, it may
      also have installed version-managed binaries under:

        ~/.local/share/spacetime/bin
        ~/.local/bin/spacetime
    EOS
  end

  def install
    bin.install "spacetimedb-cli" => "spacetime"
    bin.install "spacetimedb-standalone"
  end

  test do
    system bin/"spacetime", "--version"
  end
end
