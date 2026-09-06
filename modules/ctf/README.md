# NixOS CTF Environment

This is a modular CTF & Security environment for NixOS. It separates tools by category so they can be easily toggled on or off via `configuration.nix`.

## Module Structure

The tools are grouped into the following modules:
- `forensics.nix` - File analysis, firmware unpacking, memory forensics (binwalk, sleuthkit, volatility3, etc.)
- `osint.nix` - Reconnaissance and enumeration tools (nmap, amass, theharvester, etc.)
- `reversing.nix` - Disassemblers, debuggers, and binary utilities (ghidra, radare2, gdb, etc.)
- `networking.nix` - Packet analysis and network utilities (wireshark, tcpdump, socat, etc.)
- `crypto.nix` - Cryptography and password cracking tools (hashcat, john, openssl)
- `web.nix` - Web vulnerability scanning and fuzzing (burpsuite, gobuster, ffuf, etc.)
- `utilities.nix` - General utilities and a dedicated CTF Python environment

## How to Enable/Disable

In your `/etc/nixos/configuration.nix`, look for the CTF module block:

```nix
  # ==========================================
  # CTF Module Configuration
  # ==========================================
  ctf.forensics.enable = true;
  ctf.osint.enable = true;
  ctf.reversing.enable = true;
  ctf.networking.enable = true;
  ctf.crypto.enable = true;
  ctf.web.enable = true;
  ctf.utilities.enable = true;
```

Toggle the `true`/`false` values as needed for your specific use cases.

## Included Tools By Category

### Forensics
`file`, `binwalk`, `exiftool`, `hexyl`, `foremost`, `sleuthkit`, `testdisk`, `autopsy`, `volatility3`, `yara`, `libguestfs`, `qemu`

### OSINT
`whois`, `bind` (dig), `nmap`, `curl`, `wget`, `jq`, `ripgrep`, `amass`, `subfinder`, `httpx`, `theharvester`, `sherlock`

### Reverse Engineering
`ghidra`, `radare2`, `gdb`, `binutils` (strings/objdump), `strace`, `ltrace`, `patchelf`, `upx`, `gcc`, `clang`, `gnumake`, `cmake`

### Networking
`wireshark`, `wireshark-cli` (tshark), `tcpdump`, `nmap`, `netcat-gnu`, `socat`, `iproute2`, `iputils`, `bind`, `aircrack-ng`

### Crypto / General
`hashcat`, `john`, `openssl`, `thc-hydra`
`steghide`, `checksec`, `yq`

## CTF Workspace

A local directory structure was created at `~/CTF` to help organize your challenges:

```
~/CTF/
├── challenges/
├── downloads/
├── evidence/
├── forensics/
├── malware/
├── networking/
├── osint/
├── reversing/
├── scripts/
├── tools/
└── wordlists/
```

## Recommended Workflow & Safety

- **Safe Script Shortcuts**: Several helper commands have been added for your safety and convenience:
  - `forensic <file>`: Safely run `file`, `binwalk`, and `strings` against a suspicious file without executing it.
  - `re <binary>`: Run `file`, `checksec`, and `ldd` against a binary to gather initial static info.
  - `pcap <capture.pcap>`: Run `capinfos` for a high-level summary of a packet capture.
  - `ctf-python`: Launches a dedicated Python environment pre-loaded with CTF libraries (`pwntools`, `pycryptodome`, `capstone`, `keystone-engine`, `yara-python`, etc.).

- **Malware Analysis**: DO NOT execute suspicious binaries on the host system. Use the already-installed `virt-manager` / `libvirtd` virtualization setup for dynamic analysis in a Windows or Linux VM.

## How to Rebuild and Validate

When you edit this configuration, you should validate it via dry-build before switching:
*(Note: requires adding untracked files to git first because of flakes)*

```bash
sudo git -C /etc/nixos add modules/ctf
sudo nixos-rebuild dry-build --flake /etc/nixos#nixos
```

To permanently apply the changes:
```bash
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```
