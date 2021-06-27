class GitReq < Formula
  desc "Switch between merge/pull requests in your GitLab and GitHub repositories with just the request ID."
  homepage "https://arusahni.github.io/git-req/"
  url "https://github.com/arusahni/git-req/archive/v2.4.0.tar.gz"
  sha256 "fcce9bbea6c2c888b115aee4db274263582b8eb472da079b281ee89dbee35a4f"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix, "--path", "."
    man.mkpath
    man1.install "target/release/git-req.1"
  end

  test do
    assert_match /git-req 2.4.0/, shell_output("#{bin}/git-req --version")
  end
end
