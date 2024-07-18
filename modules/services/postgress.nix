{ pkgs, ... }: {
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    # ensureDatabases = [ "mydb" ];
    # settings = {
    #   ssl = false;  # Disable SSL for now
    # };
    # authentication = pkgs.lib.mkOverride 10 ''
    #   # Allow local connections
    #   local   all             all                                     trust

    #   # IPv4 local connections:
    #   host    all             all             127.0.0.1/32            trust

    #   # IPv6 local connections:
    #   host    all             all             ::1/128                 trust

    #   # Secure connections with scram-sha-256
    #   host    all             anower          127.0.0.1/32            scram-sha-256
    #   host    all             anower          ::1/128                 scram-sha-256
    # '';
    # initialScript = pkgs.writeText "backend-initScript" ''
    #   CREATE ROLE anower WITH LOGIN PASSWORD 'password' CREATEDB;
    #   CREATE DATABASE mydb;
    #   GRANT ALL PRIVILEGES ON DATABASE mydb TO anower;
    # '';
  };
}
