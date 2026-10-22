class Agentbox < Formula
  desc "One container per coding-agent session on a remote Docker host"
  homepage "https://github.com/novibe-org/agentbox"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/novibe-org/agentbox/releases/download/v0.2.1/agentbox-darwin-arm64"
      sha256 "42bfe0f39faf055fce7b1c009d55e27dac3e5c8db91a99ae4c9ed6ff46454f2b"
    end
    on_intel do
      url "https://github.com/novibe-org/agentbox/releases/download/v0.2.1/agentbox-darwin-x64"
      sha256 "e268fe7bb59c9b393e915667189a719aedb6afe6ea055db3381f67679ece8db9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/novibe-org/agentbox/releases/download/v0.2.1/agentbox-linux-x64"
      sha256 "9e5418718c420ecad643ac4ebd9b0c22f0ccda21801c136e7d19f779cb28da05"
    end
  end

  depends_on "opentofu"

  def install
    bin.install Dir["agentbox-*"].first => "agentbox"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/agentbox --version").strip
  end
end
