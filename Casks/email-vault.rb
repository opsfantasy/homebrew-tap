cask "email-vault" do
  version "1.1.1"
  sha256 "3afc64e3591a30ca781eba6fb36d6943c10191685155076fed07e8d0daede74c"

  url "https://github.com/opsfantasy/email-vault/releases/download/v#{version}/EmailVault-#{version}.dmg"
  name "Email Vault"
  desc "Offline, encrypted password vault that organizes accounts by email"
  homepage "https://github.com/opsfantasy/email-vault"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Email Vault.app"

  # The vault itself (~/.local/share/email-vault) is deliberately not zapped.
  zap trash: "~/Library/Preferences/local.email-vault.plist"

  caveats <<~EOS
    Email Vault is not notarized by Apple. On first launch macOS will say it
    cannot verify the developer: click Done, then open
    System Settings → Privacy & Security and click "Open Anyway".

    Your vault lives in ~/.local/share/email-vault and is never removed by
    uninstalling, even with --zap.
  EOS
end
