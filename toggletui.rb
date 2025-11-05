class Toggletui < Formula
  desc "Beautiful Terminal UI for Toggl time tracking"
  homepage "https://github.com/falt/toggletui"
  url "https://github.com/falt/toggletui/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "63865d35738e23cf23f08a663e897036599779f959cacccea3a2ece268bbf561"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  def post_install
    # Ensure Go bin directory is in PATH
    go_bin = "#{ENV["HOME"]}/go/bin"

    ohai "ToggleTUI installed successfully!"
    ohai "Get your API token from: https://track.toggl.com/profile"
    ohai ""
    ohai "Run 'toggletui' to start. You'll be prompted for your API token on first run."
  end

  test do
    assert_match "ToggleTUI", shell_output("#{bin}/toggletui --help 2>&1", 1)
  end
end
