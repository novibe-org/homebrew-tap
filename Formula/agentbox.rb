class Agentbox < Formula
  desc "One container per coding-agent session on a remote Docker host"
  homepage "https://github.com/novibe-org/agentbox"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/novibe-org/agentbox/releases/download/v0.4.0/agentbox-darwin-arm64"
      sha256 "20e40981b69d1cebb2d270ea6868eec55a5d73c44bb5bcdc17512bd1ad489dda"
    end
    on_intel do
      url "https://github.com/novibe-org/agentbox/releases/download/v0.4.0/agentbox-darwin-x64"
      sha256 "f848f6510bccbebbd590fbad4cd0bd7a559f785f5189808628872f4017415b3f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/novibe-org/agentbox/releases/download/v0.4.0/agentbox-linux-x64"
      sha256 "80c5bd52072857a8095bf448fd91b121afe8fe48fbb50959bdd27f1f4a3ee8b8"
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
