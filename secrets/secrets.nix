let
  nixos = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHIbifuLoShpYxc3xPSH4sQL0sSNklv1phF8OFF/RDlf azizul7m@gmail.com";
in
{
  "gemini.age".publicKeys = [ nixos ];
  "groq.age".publicKeys = [ nixos ];
  "openai.age".publicKeys = [ nixos ];
}

