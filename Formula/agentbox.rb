class Agentbox < Formula
  desc "One container per coding-agent session on a remote Docker host"
  homepage "https://github.com/novibe-org/agentbox"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/novibe-org/agentbox/releases/download/v0.3.0/agentbox-darwin-arm64"
      sha256 "f6e6e148231173bb331513b42708a8abfd3b80bda844f61e4ac2f5fd248a3d72"
    end
    on_intel do
      url "https://github.com/novibe-org/agentbox/releases/download/v0.3.0/agentbox-darwin-x64"
      sha256 "d22fbb78eae917c3eb0fff84184a36e4d6e6941e03cbd88adf56a0b1db1e9b8f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/novibe-org/agentbox/releases/download/v0.3.0/agentbox-linux-x64"
      sha256 "10fcb99ffa23388220b20096085f3fdd23d975be9997d1e4437f5c28b3c07940"
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
