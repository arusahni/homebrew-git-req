class GitReq < Formula
  desc "Check out merge requests from GitLab/GitHub repositories with ease!"
  homepage "https://arusahni.github.io/git-req/"
  url "https://github.com/arusahni/git-req/archive/v2.2.0-rc.2.tar.gz"
  sha256 "d4929b9215bc40236ebee9b5b495aab9cea7ac624dabe04a16af53948768555f"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix, "--path", "."
    man.mkpath
    man1.install "target/release/git-req.1"
  end

  test do
    assert_match /git-req 2.2.0-rc.2/, shell_output("#{bin}/git-req --version")
  end
end
