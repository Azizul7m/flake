let
  nixos = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOUIXeiKDjincSl+BKYeQ4hE0SSDVJHp9BDLX7Hm+YR0 azizul7m@gmail.com";
in
{
  "gemini.age".publicKeys = [ nixos ];
  "groq.age".publicKeys = [ nixos ];
  "openai.age".publicKeys = [ nixos ];
}

