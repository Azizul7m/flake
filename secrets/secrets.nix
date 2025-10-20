let
  key =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOnfsvWilvkrwHZ7MfQJSHT2lZfQ7tuVR1G9e0/bAKwy azizul7m@gmail.com";
in {
  "gemini.age".publicKeys = [ key ];
  "syncthing.age".publicKeys = [ key ];
}

