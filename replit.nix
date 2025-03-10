{ pkgs }: {
	deps = [
   pkgs.strace
		pkgs.elixir
        pkgs.elixir_ls
        pkgs.inotify-tools
	];
}